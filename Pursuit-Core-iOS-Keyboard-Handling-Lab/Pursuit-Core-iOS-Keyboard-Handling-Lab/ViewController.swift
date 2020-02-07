//
//  ViewController.swift
//  Pursuit-Core-iOS-Keyboard-Handling-Lab
//
//  Created by Bienbenido Angeles on 2/6/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//
import ImageKit
import UIKit

class ViewController: UIViewController {
    
    var mainView = MainView()
    
    lazy var imageView = mainView.imageView
    lazy var mainLabel = mainView.mainLabel
    lazy var subLabel = mainView.subLabel
    
    override func loadView() {
        view = mainView
        mainView.imageView.contentMode = .scaleAspectFill
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .systemBackground
        updateUI()
    }
    
    func updateUI(){
        imageView.getImage(with: "https://dwglogo.com/wp-content/uploads/2016/06/1800px_Sony_logo.png") { (result) in
            switch result{
            case .failure:
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(systemName: "Photo")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
        mainLabel.text = "Sony"
        subLabel.text = "Retrofit"
    }
    


}

