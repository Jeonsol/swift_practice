//
//  AlertViewController.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 7..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func returnList(_ sender: UIButton) {
        let listView = storyboard?.instantiateViewController(withIdentifier: "listViewController") as? ListViewController
        self.show(listView!, sender: self)
    }
}
