//
//  ViewController.swift
//  Exampl
//
//  Created by Admin on 19/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - View
    private var viewModel: ViewModel!
    
    private lazy var imageView: UIImageView = {
        let farame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let imageView = UIImageView(frame: farame)
        imageView.layer.borderWidth = 1.0
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32.0)
        button.setTitle("💛", for: .normal)
        return button
    }()
    
    private lazy var nextPictureButton: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        button.setTitle("Next", for: .normal)
        return button
    }()
    
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel(view: self)
        imageView.image = UIImage(named: viewModel.startImage)
        
        setupViews()
        setupConstraints()
        addActions()
    }
    
    
    //MARK: - Setup
    fileprivate func setupViews() {
        view.addSubview(imageView)
        view.addSubview(likeButton)
        view.addSubview(nextPictureButton)
    }
    
    fileprivate func setupConstraints() {
        view.translatesAutoresizingMaskIntoConstraints = false
        setupContentViewConstraints()
        setupLikeButtonConstraints()
        setupNextPictureButtonConstraints()
    }
    
    fileprivate func setupContentViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupLikeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: 0).isActive = true
        likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
    }
    
    fileprivate func setupNextPictureButtonConstraints() {
        nextPictureButton.translatesAutoresizingMaskIntoConstraints = false
        nextPictureButton.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 0).isActive = true
        nextPictureButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
    }
    
    //MARK: - Action
    private func addActions() {
        likeButton.addTarget(self, action: #selector(self.onLikeAction), for: .touchUpInside)
        nextPictureButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
    }
    
    @objc private func buttonAction() {
        viewModel.nextPictureAction()
    }
    
    @objc private func onLikeAction() {
        viewModel.updateLike()
    }
    
}

extension ViewController: ViewModelProtocol {
    func setButton(title: String) {
        likeButton.setTitle(title, for: .normal)
    }
    
    func nextPicture() {
        imageView.image = UIImage(data: viewModel.curentImage)
    }
    
}

