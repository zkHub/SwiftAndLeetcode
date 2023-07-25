//
//  Partition.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/25.
//

import Foundation

class Partation {
    
    // 4. 寻找两个正序数组的中位数 https://leetcode.cn/problems/median-of-two-sorted-arrays/
    class func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var m = nums1.count, n = nums2.count
        if (m+n) % 2 == 0 {
            return Double((getKthElement(nums1, nums2, (m+n)/2) + getKthElement(nums1, nums2, (m+n)/2+1))) / 2.0
        } else {
            return Double(getKthElement(nums1, nums2, (m+n+1)/2))
        }
    }
    // 找第k小的数
    class func getKthElement(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
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
