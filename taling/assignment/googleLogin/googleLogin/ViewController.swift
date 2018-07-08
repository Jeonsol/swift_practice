//
//  ViewController.swift
//  googleLogin
//
//  Created by 전솔 on 2018. 7. 9..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBAction func signIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    
}

