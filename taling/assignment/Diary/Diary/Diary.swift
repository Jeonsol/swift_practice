//
//  Diary.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 11..
//  Copyright © 2018년 전솔. All rights reserved.
//

import Foundation

class Diary : NSObject, NSCoding {

    override init() {
        super.init()
        self.dataSet = getData()
    }
    
    func encode(with aCoder: NSCoder) {
        // dataSet 인코드 구간
    }
    
    required init?(coder aDecoder: NSCoder) {
        // dataSet 디코드 구간
    }
    
    
    var archivePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!).appendingPathComponent("diary.component").path
    
    var dataSet : [Dictionary<String, Any>] = []
    
    func getData() -> [Dictionary<String, Any>] {
        if let diary = NSKeyedUnarchiver.unarchiveObject(withFile: archivePath) as? [Dictionary<String, Any>] {
            for data in diary {
                self.dataSet.append(data)
            }
        }
        print(archivePath)
        return dataSet
    }
    
    func saveData(_ title: String, _ content: String,_ imgData: Data) {
        let newData = ["title": title, "content": content, "imgData": imgData] as [String : Any]
        dataSet.append(newData)
        let result = NSKeyedArchiver.archiveRootObject(dataSet, toFile: archivePath)
        if !result {
            print("아카이브 실패!")
        }
    }
}
