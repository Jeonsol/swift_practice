//
//  ViewController.swift
//  Login
//
//  Created by 전솔 on 2018. 7. 3..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Login(_ sender: UIButton) {
        if emailTextField.text == "test" && passwordTextField.text == "test" {
            let 보여줄VC = storyboard?.instantiateViewController(withIdentifier: "VC2") as? SecondViewController
            present(보여줄VC!, animated: true, completion: nil)
        }
        else {
            print("로그인 멋함")
        }
    }
    
    @IBAction func login2(_ sender: UIButton) {
        performSegue(withIdentifier: "login", sender: self)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool { // 시작 전
         return true // false로 누르면 자판이 안눌림
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {//text field가 커서로 깜박이는 시점
         print("편집이 되기 시작 하였어요")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //return 을 누르면 자판이 내려간다.
        return true
    }
    
}
