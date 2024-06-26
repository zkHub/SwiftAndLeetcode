//
//  Partition.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/25.
//

import Foundation

class Partation {
    
    class func execute() {
        print(Partation().findMedianSortedArrays([1,2], [3,4]))
        print(Partation().divide(7, -3))
    }
    
    // LCR 001. 两数相除 https://leetcode.cn/problems/xoh6Oh/description/
    func divide(_ a: Int, _ b: Int) -> Int {
        if a == Int32.min && b == -1 { // 边界特判
            return Int(Int32.max)
        }
        
        let flag = (a>0 && b<0) || (a<0 && b>0) ? true : false // 标记是否正负相反
        // 都转为负数（负数转正可能溢出）
        var a = a>0 ? -a : a
        var b = b>0 ? -b : b
        // 倍增思想
        var res = 0
        while a <= b {
            var d = b, c = 1
            while d >= Int.min >> 1 && d+d >= a {
                d += d
                c += c
            }
            a -= d
            res += c
        }
        return flag ? -res : res
    }
    
    
    
    // 4. 寻找两个正序数组的中位数 https://leetcode.cn/problems/median-of-two-sorted-arrays/
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count, n = nums2.count
        if (m+n) % 2 == 0 {
            return Double((getKthElement(nums1, nums2, (m+n)/2) + getKthElement(nums1, nums2, (m+n)/2+1))) / 2.0
        } else {
            return Double(getKthElement(nums1, nums2, (m+n+1)/2))
        }
    }
    // 两个有序数组中找第k小的数
    func getKthElement(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        let l1 = nums1.count, l2 = nums2.count
        var i1 = 0, i2 = 0
        var kth = k
        while true {
            // 边界
            if i1 == l1 {
                return nums2[i2+kth-1]
            }
            if i2 == l2 {
                return nums1[i1+kth-1]
            }
            if kth == 1 {
                return min(nums1[i1], nums2[i2])
            }
            // 二分找
            let half = kth/2
            let newi1 = min(i1+half, l1) - 1
            let newi2 = min(i2+half, l2) - 1
            if nums1[newi1] <= nums2[newi2] {
                kth -= (newi1-i1+1)
                i1 = newi1+1
            } else {
                kth -= newi2-i2+1
                i2 = newi2+1
            }
        }
    }
    
    
}
