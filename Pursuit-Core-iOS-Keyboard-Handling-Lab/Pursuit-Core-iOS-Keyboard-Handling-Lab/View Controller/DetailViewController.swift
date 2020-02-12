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
    
    lazy var logoCenterYConstrainst = detailView.imageViewCenterYConstrainst
    
    private var keyboardIsVisible = false
    
    private var originalYConstrainst : NSLayoutConstraint!
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        registerForKeyboardNotifications()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        unregisterKeyboardNotifications()
    }
    
    private func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func keyboardWillShow(_ notification: NSNotification){
        guard let keyboardFrame = notification.userInfo?["UIKeyboardFrameBeginUserInfoKey"] as? CGRect else { return  }
        moveKeyBoardUp(keyboardFrame.size.height)
    }
    
    @objc
    private func keyboardWillHide(_ notification: NSNotification){
        resetUI()
    }
    
    private func moveKeyBoardUp(_ height: CGFloat){
        if keyboardIsVisible {
            return
        }
        
        originalYConstrainst = logoCenterYConstrainst
        print("Original Y constrainst", originalYConstrainst.constant)
        logoCenterYConstrainst.constant -= (height*0.9)
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        keyboardIsVisible = true
    }
    
    private func resetUI(){
        keyboardIsVisible = false
        logoCenterYConstrainst.constant -= originalYConstrainst.constant
        print("Original Y constrainst", originalYConstrainst.constant)
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
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
                    //print(self.imageView.image!.size)
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
