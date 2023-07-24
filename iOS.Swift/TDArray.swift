//
//  2DArray.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/24.
//

import Foundation

class TDArray {
    
    // 498.对角线遍历 https://leetcode.cn/problems/diagonal-traverse/
    class func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let m = mat.count
        let n = mat[0].count
        var nums = [Int]()
        var flag = true
        for i in 0..<m+n-1 {
            var x = 0, y = 0
            if flag {
                x = i<m ? i : m-1
                y = i-x
                
                while x >= 0 && y < n {
                    nums.append(mat[x][y])
                    x -= 1
                    y += 1
                }
                
            } else {
                y = i<n ? i : n-1
                x = i-y
                
                while y >= 0 && x < m {
                    nums.append(mat[x][y])
                    y -= 1
                    x += 1
                }
            }
            flag = !flag
        }
        
        return nums
    }
    
    // 54.螺旋矩阵 https://leetcode.cn/problems/spiral-matrix/
    class func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var nums = [Int]()
        var up = 0, down = matrix.count-1, left = 0, right = matrix[0].count-1
        while true {
            for i in left...right {
                nums.append(matrix[up][i])
            }
            up += 1
            if up > down {break}
            
            for i in up...down {
                nums.append(matrix[i][right])
            }
            right -= 1
            if left > right {break}
            
            for i in (left...right).reversed() {
                nums.append(matrix[down][i])
            }
            down -= 1
            if up > down {break}

            for i in (up...down).reversed() {
                nums.append(matrix[i][left])
            }
            left += 1
            if left > right {break}

        }
        
        return nums
    }
    
    // 118.杨辉三角 https://leetcode.cn/problems/pascals-triangle/
    class func generate(_ numRows: Int) -> [[Int]] {
        var nums = [[Int]]()
        for i in 0...numRows-1 {
            nums.append([Int](repeating: 1, count: i+1))
        }
        if numRows <= 2 {
            return nums
        }
        for i in 2...numRows-1 {
            for j in 1...i-1 {
                nums[i][j] = nums[i-1][j-1] + nums[i-1][j]
            }
        }
        
        return nums
        
//        var nums = [[Int]]()
//        if numRows == 1 {
//            nums = [[1]]
//        } else if numRows == 2 {
//            nums = [[1],[1,1]]
//        } else {
//            nums = [[1],[1,1]]
//            for i in 2...numRows-1 {
//                var subArr = [1,1]
//                let preArr = nums[i-1]
//                for j in 1...i-1 {
//                    subArr.insert(preArr[j-1]+preArr[j], at: j)
//                }
//                nums.append(subArr)
//            }
//        }
//        return nums
    }
    
    
}
