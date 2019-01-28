//
//  ViewModel.swift
//  Exampl
//
//  Created by Admin on 19/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation


class ViewModel {
    private var model: Model!
    private weak var view: ViewModelProtocol!
    private var networkServies: NetworkServies!
    
    //MARK: - Property
    public var startImage: String {
        return "image1"
    }
    
    public var likeTitle: String {
        return model.like ? "❤️" : "💛"
    }
    
    public var curentImage: Data {
        return model.image!
    }

    private var images = [Data]()
    private var indexImage = 0
    
    
    //MARK: - Init
    public init(view: ViewModelProtocol) {
        self.view = view
        initModel()
        initNetworkLayer()
        startInitial()
    }
    
    private func initModel() {
        self.model = Model(image: nil, like: false, index: 0)
    }
    
    private func initNetworkLayer() {
        self.networkServies = NetworkServies(core: NetworkCore())
    }

    
    //MARK: - Load Image
    private func startInitial() {
        let imageGroup = DispatchGroup()
        
        for i in 0...3 {
            let url = SouceModel.imageURLs[i]
            DispatchQueue.global().async(group: imageGroup) {
                imageGroup.enter()
                
                self.networkServies.downloadPhoto(userUrl: url) { [weak self] (data, error) in
                    guard let self = self else {return}
                    guard error == nil else {return}
                    
                    self.images.append(data!)
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
    
    public func nextPicture() {
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
