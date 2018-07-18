//
//  Diary.swift
//  TablePractice
//
//  Created by 전솔 on 2018. 7. 9..
//  Copyright © 2018년 전솔. All rights reserved.
//

//모델 파일
import Foundation

class DiaryStore: NSObject,NSCoding {

    var archivePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!).appendingPathComponent("diary.component").path
    var diaries: [Diary] = [] {
        didSet {
            saveData()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        self.diaries = aDecoder.decodeObject(forKey: "diaries") as! [Diary]
    }
    
    override init() {
        super.init()
        loadData()
        print(archivePath)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(diaries, forKey: "diaries")
    }
    
    func addDiary(_ diary: Diary) {
        diaries.append(diary)
    }
    private func saveData() {
        let result = NSKeyedArchiver.archiveRootObject(self, toFile: archivePath)
        if !result {
            print("데이터 아카이브 실패!")
        }
    }
    
    private func loadData() {
        if let diaryStore = NSKeyedUnarchiver.unarchiveObject(withFile: archivePath) as? DiaryStore{
            self.diaries = diaryStore.diaries
        } else {
            print("언아카이빙 실패!")
        }
    }
    func deleteDiary(at index: Int) {
        diaries.remove(at: index)
    }
}
