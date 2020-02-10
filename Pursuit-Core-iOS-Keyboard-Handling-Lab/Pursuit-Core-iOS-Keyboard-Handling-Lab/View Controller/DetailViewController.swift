//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Keyboard-Handling-Lab
//
//  Created by Bienbenido Angeles on 2/7/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    lazy var imageView = detailView.imageView
    lazy var loginLabel = detailView.loginLabel
    lazy var userNameTextField = detailView.userNameTextField
    lazy var passwordTextField = detailView.passwordTextField
    lazy var loginButton = detailView.loginButton
    lazy var passwordButton = detailView.passwordButton
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        updateUI()
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
    }

}

extension DetailViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
