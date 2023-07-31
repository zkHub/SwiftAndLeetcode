//
//  Enum.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/30.
//

import Foundation

class Enum {
    class func execute() {
        print(Enum().superpalindromesInRange("40000000000000000","50000000000000000"))
    }
    
    // 906. 超级回文数 https://leetcode.cn/problems/super-palindromes/
    func superpalindromesInRange(_ left: String, _ right: String) -> Int {
        let L = Int(left)!, R = Int(right)!
        var res = 0
        let magic = 100000
        // 奇数情况
        for i in 1..<magic {
            var s = Array(String(i))
            if s.count >= 2 {
                for j in (0...s.count-2).reversed() {
                    s.append(s[j])
                }
            }
            var v = Int(String(s))!
            v *= v
            if v > R {break} // 超出右侧值即可退出枚举
            if v >= L && isPalindrome(v) {
                res += 1
            }
        }
        // 偶数情况
        for i in 1..<magic {
            var s = Array(String(i))
            if s.count >= 1 {
                for j in (0...s.count-1).reversed() {
                    s.append(s[j])
                }
            }
            var v = Int(String(s))!
            v *= v
            if v > R {break} // 超出右侧值即可退出枚举
            if v >= L && isPalindrome(v) {
                res += 1
            }
        }
        return res
    }
    
    func isPalindrome(_ num: Int) -> Bool {
        var pNum = 0
        var tempNum = num
        while tempNum > 0 {
            pNum = pNum * 10 + tempNum % 10
            tempNum /= 10
        }
        return pNum == num
    }
    
}
