//
//  ViewController.swift
//  TablePractice
//
//  Created by 전솔 on 2018. 7. 3..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let data : [String] = ["한국","미국"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 10
//    }// 섹션지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    } // 몇줄 입력?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        print(indexPath)
        return cell
    }
    
    
}


extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // 현재 선택된 셀
        let viewController = storyboard?.instantiateViewController(withIdentifier:"detailViewController") as? DetailViewController
        //present(viewController!, animated: true, completion: nil) // 얘는 modal로 부름
        
        viewController?.fromText = "\(data[indexPath.row]) 칸에서 왔어"
        self.show(viewController!, sender: self) // show로 부름
    }
}
