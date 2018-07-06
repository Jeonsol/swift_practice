//
//  DetailViewController.swift
//  TablePractice
//
//  Created by 전솔 on 2018. 7. 3..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!

    var fromText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = fromText
        // Do any additional setup after loading the view.
    }
}
