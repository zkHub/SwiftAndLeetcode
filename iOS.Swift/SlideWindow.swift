//
//  SlideWindow.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/26.
//

import Foundation

class SlideWindow {
    
    class func execute() {
        print(SlideWindow().lengthOfLongestSubstring("abcabcbb"))
        print(SlideWindow().maxScore([1,2,3,4,5,6,1], 3))
        print(SlideWindow().longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))
        print(SlideWindow().longestSubarray([4,2,2,2,4,4,4,4,2,2], 0))
        print(SlideWindow().minWindow("bba", "ab"))
    }
    
    
    // 3. 无重复字符的最长子串 https://leetcode.cn/problems/longest-substring-without-repeating-characters/
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 滑动窗口
//        var queue = [Character]()
//        var maxLength = 0
//        for (_, char) in s.enumerated() {
//            while queue.contains(char) && queue.count > 0 {
//                queue.removeFirst()
//            }
//            queue.append(char)
//            maxLength = max(maxLength, queue.count)
//        }
//        return maxLength
        // 优化逻辑
        var dic = [Character: Int]()
        var start = 0
        var maxLength = 0
        for (i, char) in s.enumerated() {
            let preIndex = dic[char] ?? -1
            if preIndex >= start {
                start = preIndex + 1
            }
            let curLength = i - start + 1
            maxLength = max(maxLength, curLength)
            dic[char] = i
        }
        return maxLength
    }
    
    // 1423. 可获得的最大点数 https://leetcode.cn/problems/maximum-points-you-can-obtain-from-cards/
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        // 首尾摸k张牌最大和，转换成剩下牌的最小和 这里隐式的left、right是固定长度
        let windowLen = cardPoints.count - k
        let sum = cardPoints.reduce(0, +)
        if windowLen == 0 {
            return sum
        }
        var curSum = cardPoints[0...windowLen-1].reduce(0, +)
        var minSum = curSum
        for i in 0..<k {
            curSum = curSum - cardPoints[i] + cardPoints[i+windowLen]
            minSum = min(minSum, curSum)
        }
        return sum - minSum
    }
    
    // 1004. 最大连续1的个数 III https://leetcode.cn/problems/max-consecutive-ones-iii/
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        // 转换成最多包含k个0的最长子串长度
        var left = 0, right = 0 // 双指针，表示遍历区间 left...right
        var maxLen = 0 // 最长子串长度
        var count = 0 // 0的个数
        while right < nums.count {
            if nums[right] == 0 {
                count += 1
                while count > k { // 不符合题意的时候，先处理题意再处理left
                    if nums[left] == 0 {
                        count -= 1
                    }
                    left += 1
                }
            }
            maxLen = max(maxLen, right-left+1)
            right += 1
        }
        return maxLen
    }
    
    
    // 1438. 绝对差不超过限制的最长连续子数组 https://leetcode.cn/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        guard nums.count > 0 else{
            return 0
        }
        var rescount = 0
        var left = 0
        var right = 0
        var tempmax = nums[0]
        var tempmin = nums[0]
        while right < nums.count {
            tempmax = max(tempmax, nums[right])
            tempmin = min(tempmin, nums[right])
            let temp = abs(tempmax - tempmin)
            if temp > limit { // 这里超不过最长范围之内，left跟着right一起走就行
                if (nums[left] == tempmax || nums[left] == tempmin){
                    tempmax = nums[left + 1]
                    tempmin = nums[left + 1]
                    for i in left+1 ... right {
                        tempmax = max(tempmax, nums[i])
                        tempmin = min(tempmin, nums[i])
                    }
                }
                left += 1
            }
            rescount = max(rescount, right-left+1)
            right += 1
        }
        return  rescount
    }
    
//    func minWindow(_ s: String, _ t: String) -> String {
//        if s.count < t.count {
//            return ""
//        }
//        let sArr = Array(s), tArr = Array(t)
//        var left = 0, right = 0
//        var ansL = -1, ansR = -1, ansLen = Int.max
//
//        var sMap = [Character: Int]()
//        var tMap = [Character: Int]()
//        for (_, char) in tArr.enumerated() {
//            if tMap.keys.contains(char) {
//                tMap[char]! += 1
//            } else {
//                tMap[char] = 1
//            }
//        }
//
//        while right < sArr.count {
//            var char = sArr[right]
//            if tMap.keys.contains(char) {
//                if sMap.keys.contains(char) {
//                    sMap[char]! += 1
//                } else {
//                    sMap[char] = 1
//                }
//            }
//
//            while checkMatch(sMap, tMap) {
//                if right-left+1 < ansLen {
//                    ansLen = right-left+1
//                    ansL = left
//                    ansR = right
//                }
//                char = sArr[left]
//                if tMap.keys.contains(char) {
//                    sMap[char]! -= 1
//                }
//                left += 1
//            }
//            right += 1
//        }
//        return ansL == -1 ? "" : String(sArr[ansL...ansR])
//    }
//
//    class func checkMatch(_ sMap: Dictionary<Character, Int>, _ tMap: Dictionary<Character, Int>) -> Bool {
//        var isMatch = true
//        for (_, dict) in tMap.enumerated() {
//            if sMap.keys.contains(dict.key) {
//                if sMap[dict.key]! < dict.value {
//                    isMatch = false
//                }
//            } else {
//                isMatch = false
//            }
//        }
//        return isMatch
//    }
    
    
//    func minWindow(_ s: String, _ t: String) -> String {
//        // string转换成character数组，通过utf8转成int
//        let schars = Array(s.utf8).map{Int($0)}
//        let tchars = Array(t.utf8).map{Int($0)}
//
//        // hashmap 来存储t中各个字符的数量
//        var hash = Array(repeating: 0, count: 128)
//        for tchar in tchars {
//            hash[tchar] += 1
//        }
//
//        var count = tchars.count
//        var start = 0
//        var left = 0
//        var right = 0
//        var length = Int.max
//
//        // 移动right
//        while right < schars.count {
//            // 当right匹配到时，count-1，同时hash值减一
//            if hash[schars[right]] > 0 {
//                count -= 1
//            }
//            hash[schars[right]] -= 1
//
//            // 当完整的匹配到之后，需要挪动left，直到不符合完整匹配，先记录符合的情况，在处理left
//            while count == 0 {
//                if right - left + 1 < length {
//                    // 记录最短完全匹配
//                    length = right - left + 1
//                    start = left
//                }
//                // 当碰到第一个hash是0的就相当于，left移动下一次之后，这个字符就不符合了，hash加回来之后，等right移动寻找到这个字符，才能满足完全符合
//                if hash[schars[left]] == 0 {
//                    count += 1
//                }
//                hash[schars[left]] += 1
//                left += 1
//            }
//
//            right += 1
//        }
//        if length > schars.count {
//            return ""
//        }
//        let index1 = s.index(s.startIndex, offsetBy: start)
//        let index2 = s.index(s.startIndex, offsetBy: start + length)
//        return String(s[index1..<index2])
//      }
    
    func minWindow(_ s: String, _ t: String) -> String {
        if t.count > s.count {
            return ""
        }
        // string 转成 array 容易操作
        let schars = Array(s), tchars = Array(t)
        var start = 0, length = Int.max
        var right = 0, left = 0
        var count = 0 // 作为符合完全覆盖匹配的判断条件
        // 用map存储需要匹配字符及次数
        var hashmap = [Character: Int]()
        for (_, char) in tchars.enumerated() {
            if hashmap[char] != nil {
                hashmap[char]! += 1
            } else {
                hashmap[char] = 1
            }
        }
        // right开始移动，直到覆盖所有
        while right < schars.count {
            // 匹配到字符
            if let c = hashmap[schars[right]] {
                if c > 0 { // hash值等于0的时候就满足这个字符的匹配个数了，之后就不计总数了，但是自己还需要计
                    count += 1
                }
                hashmap[schars[right]]! -= 1
            }
            // 覆盖所有之后，开始移动left，直到缺少一个
            while count >= tchars.count {
                // 覆盖所有时，记录符合的条件，即保存最短的情况
                if right-left+1 < length {
                    length = right-left+1
                    start = left
                }
                if let c = hashmap[schars[left]] {
                    if c == 0 { // 当hash值为0的时候，表示这个字符满足匹配，下个位置就相当于缺少一个了
                        count -= 1
                    }
                    hashmap[schars[left]]! += 1
                }
                left += 1
            }
            right += 1
        }
        if start+length > schars.count {
            return ""
        }
        return String(schars[start...start+length-1])
        
    }
    
    
}
