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
    

//    var dataSet : [Int: [String: String]] = [0:["title":"비가온다","content":"오늘은 비가 왔다. 바닥이 미끄러웠다."], 1:["title":"엄청덥다", "content": "오늘은 엄청더워서 안나갔다."], 2:["title":"습하다","content": "습해도 너무 습하다. 빨래가 마르지 않는다."]]
    var dataSet : [Dictionary<String, Any>]  = getData() as! [Dictionary<String, Any>]

    override func viewDidLoad() {
        super.viewDidLoad()
        addDiary.layer.cornerRadius = addDiary.frame.height / 2
        
        
    }
    
    @IBAction func addDiary(_ sender: UIButton) {

        let addView = storyboard?.instantiateViewController(withIdentifier: "addViewController") as? AddViewController
        self.show(addView!, sender: self)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSet[(indexPath.row)]["title"] as? String

        return cell
    }
}

extension ListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = storyboard?.instantiateViewController(withIdentifier:"detailViewController") as? DetailViewController
        
        detailView?.diaryTitle = dataSet[indexPath.row]["title"] as! String
        detailView?.diaryContent = dataSet[indexPath.row]["content"] as! String

        self.show(detailView!, sender: self)

    }
}
