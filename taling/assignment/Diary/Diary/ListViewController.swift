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
    let diaryStore = Global.shared.diaryStore

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
        return diaryStore.diaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = diaryStore.diaries[indexPath.row].title
        
        return cell
    }
}

extension ListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = storyboard?.instantiateViewController(withIdentifier:"detailViewController") as? DetailViewController
        detailView?.indexPath = indexPath
        
        self.show(detailView!, sender: self)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        diaryStore.deleteDiary(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
