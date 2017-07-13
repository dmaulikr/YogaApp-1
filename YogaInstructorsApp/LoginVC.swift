//
//  LoginVC.swift
//  YogaInstructorsApp
//
//  Created by Lane Faison on 7/11/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn

//class LoginVC: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
class LoginVC: UIViewController, GIDSignInUIDelegate {


    let appTitle = UILabel()
    
//    let fbLoginButton = FBSDKLoginButton()
    let customFbButton = UIButton(type: .system)
    
//    let googleButton = GIDSignInButton()
    let customGoogleButton = UIButton(type: .system)
    
    var loggedInOnFacebook = false
    var loggedInOnGoogle = false

    override func viewDidLoad() {
        super.viewDidLoad()

//        fbLoginButton.delegate = self
//        fbLoginButton.readPermissions = ["email", "public_profile"]
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        
//        setupFacebookButton()
//        setupGoogleButton()

        setupMainUI()
        setupFacebookButton2()
        setupGoogleButton2()
    }
    
    
    func setupMainUI() {
        appTitle.text = "YogaStars"
        self.view.addSubview(appTitle)
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: appTitle, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: appTitle, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 150.0).isActive = true
        
    }
    
//    func setupFacebookButton() {
//        self.view.addSubview(fbLoginButton)
//        fbLoginButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint(item: fbLoginButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
//        NSLayoutConstraint(item: fbLoginButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50.0).isActive = true
//        NSLayoutConstraint(item: fbLoginButton, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.8, constant: 0.0).isActive = true
//    }
    
    
    func setupFacebookButton2() {
        customFbButton.backgroundColor = .blue
        
        if loggedInOnFacebook == true {
            customFbButton.setTitle("Already logged in!", for: .normal)
        } else {
            customFbButton.setTitle("Continue with Facebook", for: .normal)
        }
        
        customFbButton.setTitleColor(.white, for: .normal)
        self.view.addSubview(customFbButton)
        customFbButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: customFbButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: customFbButton, attribute: .top, relatedBy: .equal, toItem: appTitle, attribute: .bottom, multiplier: 1.0, constant: 50.0).isActive = true
        NSLayoutConstraint(item: customFbButton, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.8, constant: 0.0).isActive = true
        NSLayoutConstraint(item: customFbButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        
        customFbButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
        
    }
    
//    func setupGoogleButton() {
//        self.view.addSubview(googleButton)
//        googleButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint(item: googleButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
//        NSLayoutConstraint(item: googleButton, attribute: .top, relatedBy: .equal, toItem: customFbButton, attribute: .bottom, multiplier: 1.0, constant: 50.0).isActive = true
//        NSLayoutConstraint(item: googleButton, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.8, constant: 0.0).isActive = true
//        NSLayoutConstraint(item: googleButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
//    }
    
    func setupGoogleButton2() {
        customGoogleButton.backgroundColor = .orange
        
        if loggedInOnGoogle == true {
            customGoogleButton.setTitle("Already logged in!", for: .normal)
        } else {
            customGoogleButton.setTitle("Continue with Google", for: .normal)
        }
        
        customGoogleButton.setTitleColor(.white, for: .normal)
        self.view.addSubview(customGoogleButton)
        customGoogleButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: customGoogleButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: customGoogleButton, attribute: .top, relatedBy: .equal, toItem: customFbButton, attribute: .bottom, multiplier: 1.0, constant: 25.0).isActive = true
        NSLayoutConstraint(item: customGoogleButton, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.8, constant: 0.0).isActive = true
        NSLayoutConstraint(item: customGoogleButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        
        customGoogleButton.addTarget(self, action: #selector(handleCustomGoogleLogin), for: .touchUpInside)
    }
 
    
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        print("User has logged out of Facebook!")
//    }
// 
//    
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//        
//        if error != nil {
//            print(error)
//            return
//        }
//        print("Successfully logged in with Facebook!")
//        
//        showEmailAddress()
//    }

    
    func handleCustomFBLogin() {
        
        if loggedInOnFacebook == false {
            FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self) {
                (result, err) in
                if err != nil {
                    print("Custom FB Login failed:", err ?? "")
                    self.loggedInOnFacebook = false
                    print("loggedInOnFacebook: ", self.loggedInOnFacebook)
                    return
                }
                
                self.showEmailAddress()
                self.loggedInOnFacebook = true
                print("loggedInOnFacebook: ", self.loggedInOnFacebook)
            }
        } else {
            do {
                try Auth.auth().signOut()
                loggedInOnFacebook = false
                print("You have successfully signed out of Facebook")
            } catch {
                print("Unable to sign out of Facebook")
            }
        }
    }
    
    func handleCustomGoogleLogin() {
        GIDSignIn.sharedInstance().signIn()
        customGoogleButton.setTitle("Already logged in!", for: .normal)
    }
    
    func showEmailAddress() {
        
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            
            if error != nil {
                print("Something went wrong with our FB user: ", error ?? "")
                return
            }
            
            print("Successfully logged in with our user: ", user ?? "")
            
        })
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
            (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request:", err ?? "")
                return
            }
            
            guard let results = result else { return }
            print("RESULTS: \(results)")
        }
    }
}
