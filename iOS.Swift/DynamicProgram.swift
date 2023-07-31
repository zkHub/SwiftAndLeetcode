//
//  DynamicProgram.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/24.
//

import Foundation

class DynamicProgram {
    
    class func execute() {
        print(DynamicProgram().longestCommonSubsequence("abcde", "ace"))
        print(DynamicProgram().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
        print(DynamicProgram().isMatch("mississippi", "mis*is*p*."))
        print(DynamicProgram().isMatch44("","******"))

    }
    
    // 1143.最长公共子序列 https://leetcode.cn/problems/longest-common-subsequence/
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
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
    func maxSubArray(_ nums: [Int]) -> Int {
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
    
    // 10.正则表达式匹配 https://leetcode.cn/problems/regular-expression-matching/
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s)
        let pArr = Array(p)
        // 定义状态
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: p.count+1), count: s.count+1)
        // 处理边界
        dp[0][0] = true // s p 都为空时
        // s空 p不空 那p最后得是*，且dp[0][j-2]得是true 才可能是true，否则为false
        for j in 1...p.count {
            if pArr[j-1] == "*" {
                dp[0][j] = dp[0][j-2]
            }
        }
        // 递推公式
        for i in 1...sArr.count {
            for j in 1...pArr.count {
                if sArr[i-1] == pArr[j-1] || pArr[j-1] == "." {
                    dp[i][j] = dp[i-1][j-1]
                } else if pArr[j-1] == "*" {
                    if sArr[i-1] == pArr[j-2] || pArr[j-2] == "." {
                        dp[i][j] = dp[i-1][j-2] || dp[i-1][j]
                    } else {
                        dp[i][j] = dp[i][j-2]
                    }
                }
            }
        }
        return dp[s.count][p.count]
    }
    
    // 44. 通配符匹配 https://leetcode.cn/problems/wildcard-matching/
    func isMatch44(_ s: String, _ p: String) -> Bool {
        let s = Array(s)
        let p = Array(p)
        // 定义状态
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: p.count+1), count: s.count+1)
        // 确认边界 s空p空true s空p非空p得全是* s非空p空false
        dp[0][0] = true
        for (i, char) in p.enumerated() {
            if char == "*" {
                dp[0][i+1] = true
            } else {
                break
            }
        }
        if s.count == 0 || p.count == 0 {
            return dp[s.count][p.count]
        }
        // 递推公式
        for i in 1...s.count {
            for j in 1...p.count {
                if p[j-1] != "*" {
                    if s[i-1] == p[j-1] || p[j-1] == "?" {
                        dp[i][j] = dp[i-1][j-1]
                    }
                } else {
                    dp[i][j] = dp[i-1][j] || dp[i][j-1]
                }
            }
        }
        
        return dp[s.count][p.count]
    }
    
}
