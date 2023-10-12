//
//  Exams.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/31.
//

import Foundation

class Exams {
    
// https://www.nowcoder.com/exam/test/71534451/detail?pid=1088888
    
    func execute() {
//        main("3 10 81 0")
//        var set = Set<Int>()
//        set.insert(1)
//        let array = Array(set).sorted()
        print(SixteenToTen("0x2c"))
    }
    
    
    // 1.3个空瓶换一个，可借需还，有n个空瓶能喝多少瓶
    func main(_ string: String) {
        let parts = string.split(separator: " ")
        for part in parts {
            let num = Int(part)!
            if num == 0 {return}
            print(redeemBottle(num))
        }
    }
    
    func redeemBottle(_ emptyNum: Int) -> Int {
        var num = 0
        func redeem(_ count: Int) {
            if count < 2 {
                return
            }
            var res = count / 3
            var m = count % 3
            if m == 2 {
                res += 1
                m = 0
            }
            num += res
            redeem(res + m)
        }
        redeem(emptyNum)
        return num
    }
    
    func SixteenToTen(_ input: String) -> Int {
        var input = input
        if input.hasPrefix("0x") {
            input = String(input.suffix(input.count-2))
        }
        var res = 0
        var num = 0
        for (i, char) in input.reversed().enumerated() {
            switch char.lowercased() {
                case "a" : num = 10
                case "b" : num = 11
                case "c" : num = 12
                case "d" : num = 13
                case "e" : num = 14
                case "f" : num = 15
                default: num = Int(String(char)) ?? 0
            }
            res += num * Int(powf(16, Float(i)))
        }
        return res
    }
    
    
    func reverseString(_ str: String) -> String {
        var array = Array(str)
        var i = 0, j = array.count - 1
        while i < j {
            (array[i], array[j]) = (array[j], array[i])
            i = i + 1
            j = j - 1
        }
        return String(array)
    }
    
}
