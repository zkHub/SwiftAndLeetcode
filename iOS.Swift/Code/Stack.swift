//
//  Stack.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/29.
//

import Foundation

class Stack {
    
    class func execute() {
        print(Stack().largestRectangleArea([2,1,5,6,2,3]))
        print(Stack().maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
    }
    
    // 84. 柱状图中最大的矩形 https://leetcode.cn/problems/largest-rectangle-in-histogram/
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var area = 0
        var left = [Int](repeating: -1, count: heights.count), right = [Int](repeating: heights.count, count: heights.count)
        var stack = [Int]()
        for i in 0...heights.count-1 {
            while stack.count > 0 && heights[i] < heights[stack.last!] {
                right[stack.last!] = i
                stack.removeLast()
            }
            left[i] = stack.count == 0 ? -1 : stack.last!
            stack.append(i)
        }
        
        for i in 0...heights.count-1 {
            area = max(area, (right[i]-left[i]-1)*heights[i])
        }
        return area
    }
    
    // 85. 最大矩形 https://leetcode.cn/problems/maximal-rectangle/
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        var area = 0
        var heights = [Int](repeating: 0, count: matrix[0].count)
        for (_, chars) in matrix.enumerated() {
            for (j, char) in chars.enumerated() {
                if char == "1" {
                    heights[j] += 1
                } else {
                    heights[j] = 0
                }
            }
            area = max(area, largestRectangleArea(heights))
        }
        return area
    }
    
    
    
}
