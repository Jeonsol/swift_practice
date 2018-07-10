//
//  Diary.swift
//  TablePractice
//
//  Created by 전솔 on 2018. 7. 9..
//  Copyright © 2018년 전솔. All rights reserved.
//

import Foundation

// 인코딩을 위해 nsobject, nscode
class Diary: NSObject, NSCoding {
    var title : String?
    var body : String?
    var image : Data?
    
    var archivePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!).appendingPathComponent("diary.component").path
    
    override init() {
        super.init()
        loadData()
        print(archivePath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.body = aDecoder.decodeObject(forKey: "body") as? String
        self.image = aDecoder.decodeObject(forKey: "image") as? Data
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(body, forKey: "body")
        aCoder.encode(image, forKey: "image")
    }

    func saveData() {
        let result = NSKeyedArchiver.archiveRootObject(self, toFile: archivePath)
        if !result {
            print("데이터 아카이브 실패!")
        }
    }
    
    func loadData() {
        if let diary = NSKeyedUnarchiver.unarchiveObject(withFile: archivePath) as? Diary {
            title = diary.title
            body = diary.body
            image = diary.image
            print("이미지경로는요\(body)")
        } else {
            print("언아카이빙 실패!")
        }
    }
    
}
