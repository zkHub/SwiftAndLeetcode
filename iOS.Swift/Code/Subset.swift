//
//  Subset.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/30.
//

import Foundation


class Subset {
    class func execute() {
        print(Subset().subsets([1,2,3]))
        print(Subset().subsets1([1,2,3]))
    }
    // 78. 子集 https://leetcode.cn/problems/subsets/
    func subsets(_ nums: [Int]) -> [[Int]] {
        // 可以用二进制表示每个位置是否参与子集
        var res = [[Int]]()
        var sub = [Int]()
        for mask in 0..<(1 << nums.count) {
            sub.removeAll()
            for (i, num) in nums.enumerated() {
                if (mask & (1 << i)) != 0 {
                    sub.append(num)
                }
            }
            res.append(sub)
        }
        return res
    }
    
    func subsets1(_ nums: [Int]) -> [[Int]] {
        // 回溯方法（用或者不用）
        var res = [[Int]]()
  
        func backtrace(_ i:Int, _ sub:[Int]) {
            var temp = sub
            res.append(sub)
            if i >= nums.count {
                return
            }
            for j in i...nums.count-1 {
                temp.append(nums[j])
                backtrace(j+1, temp)
                temp.removeLast()
            }
        }
        
        backtrace(0, [Int]())
        
        return res
    }
    
    
}
