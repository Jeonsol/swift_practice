//
//  DiaryStore.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 11..
//  Copyright © 2018년 전솔. All rights reserved.
//

import Foundation

class DiaryStore {
    
    var DiaryStore : [Dictionary<String, Any>] = []
    var diary = Diary()
    
    var archivePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!).appendingPathComponent("diary.component").path
    
    func loadData(row: Int) {
        if let datas = NSKeyedUnarchiver.unarchiveObject(withFile: archivePath) as? DiaryStore {
            for data in datas {
                DiaryStore.append(data)
            }
        }
    }
}
