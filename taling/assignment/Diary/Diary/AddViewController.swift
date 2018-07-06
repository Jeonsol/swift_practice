//
//  AddViewController.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 6..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addTitle: UITextField!
    
    @IBOutlet weak var addContent: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    
    @IBAction func addDiary(_ sender: UIButton) {
        
        SaveData(id: 3, title: addTitle.text!,content:addContent.text!)
//        let listView = storyboard?.instantiateViewController(withIdentifier:"listViewController") as? ListViewController
//
//        listView?.dataSet[(listView?.dataSet.count)!] = ["title": addTitle.text!, "content": addContent.text!]

//        print(listView?.dataSet)
    }
    
}
