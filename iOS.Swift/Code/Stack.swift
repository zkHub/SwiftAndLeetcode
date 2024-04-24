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
        var res = 0
        var stack = [Int]()
        stack.append(0)
        let heights = [0] + heights + [0]
        
        for i in 1..<heights.count {
            while heights[i] < heights[stack.last!] {
                let curHeight = heights[stack.last!]
                stack.removeLast()
                let curWidth = i - stack.last! - 1
                res = max(res, curHeight * curWidth)
            }
            stack.append(i)
        }
        
        return res
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
