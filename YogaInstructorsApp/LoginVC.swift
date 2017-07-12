//
//  LoginVC.swift
//  YogaInstructorsApp
//
//  Created by Lane Faison on 7/11/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginVC: UIViewController, FBSDKLoginButtonDelegate {

    let fbLoginButton = FBSDKLoginButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        fbLoginButton.delegate = self

    
        setupFacebookButton()
    }
    
    func setupFacebookButton() {
        self.view.addSubview(fbLoginButton)
        fbLoginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint(item: fbLoginButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: fbLoginButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50).isActive = true
        NSLayoutConstraint(item: fbLoginButton, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.8, constant: 0.0).isActive = true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User has logged out of Facebook!")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error)
            return
        }
        print("Successfully logged in with Facebook!")
    }


}
