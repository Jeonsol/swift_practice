//
//  Global.swift
//  TablePractice
//
//  Created by 전솔 on 2018. 7. 17..
//  Copyright © 2018년 전솔. All rights reserved.
//

import Foundation

class Global {
    static let shared = Global()
    let diaryStore : DiaryStore
    
    init() {
        diaryStore = DiaryStore()
    }
}
