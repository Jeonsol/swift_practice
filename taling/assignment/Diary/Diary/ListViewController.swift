//
//  ListViewController.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 6..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController {
    
    @IBOutlet weak var addDiary: UIButton!
    var diary = Diary()

    override func viewDidLoad() {
        super.viewDidLoad()
        addDiary.layer.cornerRadius = addDiary.frame.height / 2        
    }
    
    @IBAction func addDiary(_ sender: UIButton) {
        
        let addView = storyboard?.instantiateViewController(withIdentifier: "addViewController") as? AddViewController
        self.show(addView!, sender: self)
    }
    
    @IBAction func deleteDiary(_ sender: UIButton) {
        //deleteRecords(id: 1)
        
        let alertView = storyboard?.instantiateViewController(withIdentifier: "alertViewController") as? AlertViewController
        
        self.show(alertView!, sender: self)
        
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diary.dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = diary.dataSet[(indexPath.row)]["title"] as? String
        
        return cell
    }
}

extension ListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = storyboard?.instantiateViewController(withIdentifier:"detailViewController") as? DetailViewController

        detailView?.diaryTitle = diary.dataSet[indexPath.row]["title"] as! String
        detailView?.diaryContent = diary.dataSet[indexPath.row]["content"] as! String
        
        self.show(detailView!, sender: self)
        
    }
}
