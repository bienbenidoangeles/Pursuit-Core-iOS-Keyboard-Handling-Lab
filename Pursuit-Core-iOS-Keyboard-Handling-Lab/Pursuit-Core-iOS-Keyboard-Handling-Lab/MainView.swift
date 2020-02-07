//
//  MainView.swift
//  Pursuit-Core-iOS-Keyboard-Handling-Lab
//
//  Created by Bienbenido Angeles on 2/6/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    lazy var mainLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: label.font.pointSize)
        return label
    }()
    
    lazy var subLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: label.font.pointSize)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpImageViewConstrainsts()
        //setUpMainLabel()
        //setUpSubLabel()
    }
    
    private func setUpImageViewConstrainsts(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
        ])
    }
    
    private func setUpMainLabel(){
        addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 40),
        ])
    }
    
    private func setUpSubLabel(){
        addSubview(subLabel)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 8),
            subLabel.centerXAnchor.constraint(equalTo: mainLabel.centerXAnchor)
        ])
    }
}

extension UIImage{
    func resizeImage(){
        
    }
}
