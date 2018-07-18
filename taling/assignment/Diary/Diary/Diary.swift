//
//  Diary.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 11..
//  Copyright © 2018년 전솔. All rights reserved.
//

import Foundation

class Diary : NSObject, NSCoding {
    var title: String?
    var content: String?
    var image: Data?
    
    init(title: String, content: String, image: Data) {
        self.title = title
        self.content = content
        self.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.content = aDecoder.decodeObject(forKey: "content") as? String
        self.image = aDecoder.decodeObject(forKey: "image") as? Data
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(content, forKey: "content")
        aCoder.encode(image, forKey: "image")
    }
}
