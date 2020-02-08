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
    
    private lazy var imageView = mainView.imageView
    private lazy var mainLabel = mainView.mainLabel
    private lazy var subLabel = mainView.subLabel
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .systemBackground
        updateUI()
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func screenTapped(){
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    private func updateUI(){
        imageView.getImage(with: "https://dwglogo.com/wp-content/uploads/2016/06/1800px_Sony_logo.png") { (result) in
            switch result{
            case .failure:
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(systemName: "Photo")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    let screenSize = UIScreen.main.bounds.size
                    self.imageView.image = image.resizeImage(to: screenSize.width*0.8, height: screenSize.width*0.448)
                    print(self.imageView.image!.size)
                }
            }
        }
        mainLabel.text = "Sony"
        subLabel.text = "Retrofit Edition"
    }
    


}

