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
    lazy var loginButton = detailView.loginButton
    lazy var passwordButton = detailView.passwordButton
//    var player: AVPlayer?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        updateUI()
    }
    
//    private func play(url:NSURL) {
//        print("playing \(url)")
//
//        do {
//
//            let playerItem = AVPlayerItem(url: url as URL)
//
//            self.player = try AVPlayer(playerItem: playerItem)
//            player!.volume = 1.0
//            player!.play()
//        } catch let error as NSError {
//            self.player = nil
//            print(error.localizedDescription)
//        } catch {
//            print("AVAudioPlayer init failed")
//        }
//    }
    
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
        loginLabel.text = "Login"
        loginButton.titleLabel?.text = "Login"
        passwordButton.titleLabel?.text = "Forgot Password?"
    }

}
