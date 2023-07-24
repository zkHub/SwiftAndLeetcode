//
//  DynamicProgram.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/24.
//

import Foundation

class DynamicProgram {
    
    // 1143.最长公共子序列 https://leetcode.cn/problems/longest-common-subsequence/
    class func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: text2.count+1), count: text1.count+1)
        let array1 = Array(text1)
        let array2 = Array(text2) // 这里转成array，否则String的index特别耗时
        for i in 1...array1.count {
            for j in 1...array2.count {
                if array1[i-1] == array2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i-1][j])
                }
            }
        }
        return dp[text1.count][text2.count]
    }

    // 53.最大子数组和 https://leetcode.cn/problems/maximum-subarray/
    class func maxSubArray(_ nums: [Int]) -> Int {
//        var dp = [Int](repeating: nums[0] , count: nums.count)
//        for i in 1..<nums.count {
//            dp[i] = dp[i-1]<0 ? nums[i] : dp[i-1] + nums[i]
//        }
//        var maxSum = nums[0]
//        for i in 0..<nums.count {
//            maxSum = max(maxSum, dp[i])
//        }
        var pre = 0
        var maxSum = nums[0]
        for i in 0..<nums.count {
            pre = max(pre+nums[i], nums[i])
            maxSum = max(maxSum, pre)
        }
        
        return maxSum
    }
    
    
}
