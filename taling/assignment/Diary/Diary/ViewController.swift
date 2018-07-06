//
//  ViewController.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 6..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height * 0.3 / 2
    }
    
    @IBAction func clickLogin(_ sender: UIButton) {
        let listView = storyboard?.instantiateViewController(withIdentifier: "listViewController") as? ListViewController
        self.show(listView!, sender: self)
//        if emailText.text == "test" && passwordText.text == "1" {
//            let listView = storyboard?.instantiateViewController(withIdentifier: "listViewController") as? ListViewController
//            self.show(listView!, sender: self)
//        }
//        else {
//            print("로그인실패")
//        }
    }
}
