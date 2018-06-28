//
//  Calculator.swift
//  TestProject
//
//  Created by user on 2018. 6. 18..
//  Copyright © 2018년 user. All rights reserved.
//

import Foundation // int, 배열, 기본적인게 들어있다

//: Playground - noun: a place where people can play
// swift는 형에 민감

import UIKit

let a: Int = 0
let b: String = "hello"
let c: Double = 0.0
let d: Bool = false
let array: [String] = ["a", "b", "c"]
let set: Set<Int> = [1] // 중복이 없는 배열

//type에 별명을 붙여주는 것.
typealias 숫자 = Int

class 계산기 {
    let 입력1: Int
    let 입력2: Int
    
    init(입력1: 숫자, 입력2: 숫자) {
        self.입력1 = 입력1
        self.입력2 = 입력2
    }
    
    func 더하기(_ 입력1: 숫자, _ 입력2: 숫자) -> 숫자 { // _는 밖에서 쓰이느 이름, 입력1, 입력2는 내부에서 쓰이는것
        return 입력1 + 입력2
    }
    
    func indexOfAddress(adress: String) {
        
    }
    
    func index(of address: String) {
        
    }
}

let 나의계산기 = 계산기(입력1: 3, 입력2: 4)

let 결과 = 나의계산기.더하기(3, 4)


