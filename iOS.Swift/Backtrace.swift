//
//  Backtrace.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/21.
//

import Foundation


class Backtrace {
    
    class func execute() {
        print(Backtrace().letterCombinations("23"))
    }
    
    // 17.电话号码的字母组合 https://leetcode.cn/problems/letter-combinations-of-a-phone-number/
    func letterCombinations(_ digits: String) -> [String] {
        let map = [
            "2":"abc",
            "3":"def",
            "4":"ghi",
            "5":"jkl",
            "6":"mno",
            "7":"pqrs",
            "8":"tuv",
            "9":"wxyz"
        ]
        
        var res = [String]()
        var str = ""
        func backtrace(index: Int) {
            // 递归退出条件
            if index == digits.count {
                if str != "" {
                    res.append(str) // 收集结果
                }
                return
            }
            let num = digits[digits.index(digits.startIndex, offsetBy: index)]
            for i in map[String(num)]! {
                str.append(String(i)) // 处理节点
                backtrace(index: index+1) // 递归
                str.removeLast() // 回溯
            }
        }
        backtrace(index: 0)
        return res
    }
    
}
