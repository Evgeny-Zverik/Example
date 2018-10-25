//
//  ViewModel.swift
//  Exampl
//
//  Created by Admin on 19/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

public protocol ViewModelProtocol {
    func nextPicture()
    func setButton(title: String)
}

class ViewModel {
    private var model: Model!
    private var view: ViewModelProtocol!
    private var core: NetworkCoreProtocol!
    private var networkServies: NetworkServies!
    


    var images = [Data]()
    var indexImage = 0
    
    //MARK: - Init
    public init(view: ViewModelProtocol) {
        self.view = view
        self.model = Model(image: nil, like: false, index: 0)
        core = NetworkCore()
        self.networkServies = NetworkServies(core: core)
        startInitial()
    }
    
    //MARK: - Property get
    public var startImage: String {
        return "image1"
    }
    
    public var likeTitle: String {
        return model.like ? "❤️" : "💛"
    }
    
    public var curentImage: Data {
        return model.image!
    }

    
    //MARK: - Load Image
    public func startInitial() {
        let imageGroup = DispatchGroup()
        for i in 0...1 {
            DispatchQueue.global().async(group: imageGroup) {
                let url = SouceModel.imageURLs[i]
                imageGroup.enter()
                self.networkServies.downloadPhoto(userUrl: url) { [weak self] (data, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    self?.images.append(data!)
                    imageGroup.leave()
                }
            }
        }
        
        for i in 2...3 {
            DispatchQueue.global().async(group: imageGroup) {
                let url = SouceModel.imageURLs[i]
                imageGroup.enter()
                self.networkServies.downloadPhoto(userUrl: url) { [weak self] (data, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    self?.images.append(data!)
                    imageGroup.leave()
                }
            }
        }
        
        imageGroup.notify(queue: DispatchQueue.main) {
            self.model.index = self.images.count
        }
    }
    
    
    //MARK: - Method logic
    public func updateLike() {
        model.like = !model.like
        view.setButton(title: likeTitle)
    }
    
    func nextPicture() {
        while model.index != indexImage {
            model.image = self.images[indexImage]
            view.nextPicture()
            indexImage += 1
            guard model.like else {return}
            updateLike()
        }
    }
    
    public func nextPictureAction() {
        nextPicture()
        view.setButton(title: likeTitle)
    }
}
