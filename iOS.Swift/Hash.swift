//
//  Hash.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/29.
//

import Foundation

class Hash {
    
    class func execute() {
        let res = Hash().groupAnagrams(["ddddddddddg","dgggggggggg"])
        print(res)
    }
    // 49. 字母异位词分组 https://leetcode.cn/problems/group-anagrams/
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String:[String]]()

        for str in strs {
            let index = String(str.sorted())
            if dict[index] != nil {
                dict[index]!.append(str)
            } else {
                dict[index] = [str]
            }
        }
        return Array(dict.values)
    }
    
}
