//
//  DiaryStore.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 18..
//  Copyright © 2018년 전솔. All rights reserved.
//

import Foundation

class DiaryStore: NSObject, NSCoding {
    var archivePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!).appendingPathComponent("diary.component").path
    var diaries : [Diary] = [] {
        didSet {
            saveData()
        }
    }
    
    override init() {
        super.init()
        loadData()
    }
    required init?(coder aDecoder: NSCoder) {
        self.diaries = aDecoder.decodeObject(forKey: "diaries") as! [Diary]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(diaries, forKey: "diaries")
    }
    func addDiary(_ diary: Diary) {
        diaries.append(diary)
    }
    func deleteDiary(at index: Int) {
        diaries.remove(at: index)
    }
    private func saveData() {
        let result = NSKeyedArchiver.archiveRootObject(self, toFile: archivePath)
        if !result {
            print("데이터 아카이브 실패!")
        }
    }
    private func loadData() {
        if let diaryStore = NSKeyedUnarchiver.unarchiveObject(withFile: archivePath) as? DiaryStore {
            self.diaries = diaryStore.diaries
        }
        else {
            print("언아카이빙 실패!")
        }
    }
}
