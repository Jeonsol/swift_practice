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

    init(title: String, body: String, image: Data) {
        self.title = title
        self.body = body
        self.image = image
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
    
}
