//
//  LowestCommonMutiple.swift
//  iOS.Swift
//
//  Created by zk on 2023/8/9.
//

import Foundation


class LCM {
    
    func execute() {
        print(fingLCM([10, 5, 60]))
        print(gcd(2, 3))
        print(lcm(2, 3))
    }
    
    // 判断一个数是否为质数
    
//    素数出现规律：
//    当n≧5时，如果n为素数，那么n mod 6 = 1 或 n mod 6 = 5，即n一定出现在6x（x≥1） 两侧。
//    证明：
//    当x ≥1时，有如下表示方法：
//    ┈┈  6x，6x+1，6x+2，6x+3，6x+4，6x+5，6(x+1），6(x+1)+1┈┈
//    不在6x两侧的数为 6x+2 ， 6x+3 ， 6x+4，即2(3x+1)，3(2x+1)，2(3x+2)，它们一定不是素数，所以素数一定出现在6x的两侧。
//
//    原文链接：https://blog.csdn.net/code_pang/article/details/7880245
    
    func isPrimeNumber(_ num: Int) -> Bool {
        if num == 2 || num == 3 {
            return true
        }
        if num % 6 != 1 && num % 6 != 5 {
            return false
        }
        var i = 5
        while i*i <= num {
            if num % i == 0 || num % (i+2) == 0 {
                return false
            }
            i += 6
        }
        return true
    }
    
    
    // 最大公约数
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b==0 ? a : gcd(b, a%b);
    }
    
    // 最小公倍数 = (a * b)/最大公约数
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a, b)
    }

    
//    已知，每个数都可以分解成一定数目的质因数的乘积，于是可以求出数组所有元素的质因数，这些质因数的乘积就是整个数组的最小公倍数
//    具体解法概述如下：
//
//    初始时设置 lcm 为 1，并设置标记 count 为统计当前数组中 1 的个数（如果数组元素都为 1，即表示当前 lcm 值为整个数组的最小公倍数），以及一个初始的因数 div 为 2
//    在 count 小于 数组长度时重复循环，每次循环时设置一个标志位 isDivided，用于表示当前因数是否需要更新，然后遍历数组，若数组有不为 1 的元素且能整除当前的因数 div，则设置 isDivided 为 true，表示数组中还有元素的因数为当前因数。遍历结束后，根据标志位选择更新 lcm 还是因数 div
    
    func fingLCM(_ nums:[Int]) -> Int {
        var nums = nums
        // 标志位，用于表示因数是否需要更新
        var isDivided = false;
        var n = nums.count;
        // 表示当前数组中 1 的个数
        var count = 0;
        // 当前计算的最小公倍数
        var lcm = 1;
        // 当前的因数
        var div = 2;
        // 在数组中还有非 1 元素时重复循环
        while (count != n) {
            // 初始化标记为
            isDivided = false;
            // 初始化计数
            count = 0;
            // 遍历数组
            for i in 0..<n {
                // 若当前数不为 1 且可以整除因数 div
                if (nums[i] != 1 && nums[i] % div == 0) {
                    // 更新标志位
                    isDivided = true;
                    // 更新当前数
                    nums[i] /= div;
                }
                // 更新数组中 1 的个数
                if (nums[i] == 1) {
                    count += 1;
                }
            }
            // 若标记位为 true，则当前因数在本轮使用过
            if (isDivided) {
                // 更新最小公倍数
                lcm *= div;
            } else {    // 否则更新因数，表示数组元素中不在包含本因数
                div += 1;
            }
        }
        return lcm;
    }

}
