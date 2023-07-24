//
//  Greedy.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/21.
//

import Foundation

class Greedy {
    
    // 135.分发糖果 https://leetcode.cn/problems/candy/
    class func candy(_ ratings: [Int]) -> Int {
        // 从左到右，按规则计算
        var left = [Int](repeating: 1, count: ratings.count)
        for i in 1..<ratings.count {
            if ratings[i] > ratings[i-1] {
                left[i] = left[i-1]+1
            }
        }
        var count = left[left.count-1]
        // 从左到右，按规则计算
        var right = [Int](repeating: 1, count: ratings.count)
        for i in (0..<ratings.count-1).reversed() {
            if ratings[i] > ratings[i+1] {
                right[i] = right[i+1]+1
            }
            count += max(left[i], right[i]) // 取出都满足的值
        }
    
        return count
    }
    
    // 11.盛最多水的容器 https://leetcode.cn/problems/container-with-most-water/
    class func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count-1
        var area = 0
        while left < right {
            if height[left] < height[right] {
                area = max(area, height[left] * (right - left))
                left = left + 1
            } else {
                area = max(area, height[right] * (right - left))
                right = right - 1
            }
        }
        return area
    }
    
    
}
