//
//  CoreData.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 7..
//  Copyright © 2018년 전솔. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}

func SaveData (id: Int, title: String, content: String) {
    //ManagedObjectContext 불러오기
    let context = getContext()
    //entity 설정
    let entity = NSEntityDescription.entity(forEntityName: "Diary", in: context)
    let Itmes = NSManagedObject(entity: entity!, insertInto: context)
    //entity 값 설정 key 값 == entity 속성값 이름
    Itmes.setValue(id, forKey: "id")
    Itmes.setValue(title, forKey: "title")
    Itmes.setValue(content, forKey: "content")
    
    
    // 객체 저장 하기
    do {
        try context.save()
        print("saved!")
    } catch let error as NSError {
        print("Could not save \(error)")
    } catch {
    }
}

func getData () -> Array<Any> {
    //entity값에 대한 fetch request 생성
    let fetchRequest: NSFetchRequest<Diary> = Diary.fetchRequest()
    var dataSet : [Dictionary<String, Any>] = []
    do {
        // 결과값 담기
        let searchResults = try getContext().fetch(fetchRequest)
        // for 문을 이용하여 Key 값에 대한 Value 값 가져오기
        var data : [String: Any] = [:]
        for Diary in searchResults as [NSManagedObject] {
            var id = 0
            var title = ""
            var content = ""
            
            if let diaryId = Diary.value(forKey: "id") {
                id = diaryId as! Int
            }
            else {
                id = 0
            }
            
            if let diaryTitle = Diary.value(forKey: "title") {
                title = diaryTitle as! String
            }
            else {
                title = "제목없음"
            }
            
            if let diaryContent = Diary.value(forKey: "content") {
                content = diaryContent as! String
            }
            else {
                content = "내용없음"
            }
            
            data=["id":id,"title": title, "content": content]
            
            dataSet.append(data)
            
        }
    } catch {
        print("Error with request: \(error)")
    }
    return dataSet
}

func deleteRecords(id: Int) -> Void {
    let moc = getContext()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary")
    
    let result = try? moc.fetch(fetchRequest)
    let resultData = result as! [Diary]
    
    for object in resultData {
        if let diaryId = object.value(forKey: "id") {
            if diaryId as! Int == id {
                moc.delete(object)
            }
        }
    }
    
    do {
        try moc.save()
        print("saved!")
    } catch let error as NSError  {
        print("Could not save \(error), \(error.userInfo)")
    } catch {
        
    }
}

