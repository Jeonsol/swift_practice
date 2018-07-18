//
//  ViewController.swift
//  TablePractice
//
//  Created by 전솔 on 2018. 7. 3..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let diaryStore = Global.shared.diaryStore

    override func viewDidLoad() {
        super.viewDidLoad()
//        let button = UIButton()
//        button.setTitle("title", for: .normal)
//        button.setTitleColor(UIColor.red, for: .normal)
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        self.view.addSubview(button)
//        button.addTarget(self, action: #selector(hello), for: .touchUpInside)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func hello() {
        
    }
    
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryStore.diaries.count
        
    } // 몇줄 입력?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = diaryStore.diaries[indexPath.row].title
        return cell
    }
    
    
}


extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // 현재 선택된 셀
        let viewController = storyboard?.instantiateViewController(withIdentifier:"detailViewController") as? DetailViewController
        //present(viewController!, animated: true, completion: nil) // 얘는 modal로 부름
        
       // self.show(viewController!, sender: self) // show로 부름
        
        viewController?.indexPath = indexPath
        
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        diaryStore.deleteDiary(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
