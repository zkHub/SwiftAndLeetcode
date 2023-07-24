//
//  Sort.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/13.
//

import Foundation


class Sort {
    
    func sort(){
        var array = [1,3,5,2,4]
//        bubbleSort(array: &array)
//        selectionSort(array: &array)
        mergeSort(array: &array)
        print(array)
    }

    
    func mergeSort(array:inout Array<Int>) {
        if array.count < 2 {
            return
        }
        process(array: &array, L: 0, R: array.count-1)
    }
    func process(array:inout Array<Int>, L: Int, R: Int) {
        if L == R {
            return
        }
        let mid = L+((R-L) >> 1)
        process(array: &array, L: L, R: mid)
        process(array: &array, L: mid+1, R: R)
        merge(array: &array, L: L, M: mid, R: R)
    }
    func merge(array:inout Array<Int>, L: Int, M: Int, R: Int) {
        var help: Array<Int> = []
        var p1 = L
        var p2 = M+1
        while p1 <= M && p2 <= R {
            if array[p1] < array[p2] {
                help.append(array[p1])
                p1 = p1 + 1
            } else {
                help.append(array[p2])
                p2 = p2 + 1
            }
        }
        while p1 <= M {
            help.append(array[p1])
            p1 = p1 + 1
        }
        while p2 <= R {
            help.append(array[p2])
            p2 = p2 + 1
        }
        for i in 0..<help.count {
            array[L+i] = help[i]
        }
    }
    
    // 插入排序
    func insertionSort(array:inout Array<Int>) {
        if array.count < 2 {
            return
        }
        // 0~i做到有序
        for i in 1..<array.count {
            for j in (0...i-1).reversed() where array[j+1]<array[j] {
                (array[j], array[j+1]) = (array[j+1], array[j])
            }
        }
    }
    
    // 选择排序
    func selectionSort(array:inout Array<Int>) {
        if array.count < 2 {
            return
        }
        var minIndex = 0
        for i in 0..<array.count-1 {
            minIndex = i
            for j in i+1..<array.count {
                minIndex = array[j] < array[minIndex] ? j : minIndex
            }
            (array[i], array[minIndex]) = (array[minIndex], array[i])
        }
    }
    
    // 冒泡排序
    func bubbleSort(array:inout Array<Int>){
        if array.count < 2 {
            return
        }
        for i in 0..<array.count {
            let e = array.count-1 - i
            for j in 0..<e {
                if array[j] > array[j+1] {
                    (array[j], array[j+1]) = (array[j+1], array[j])
                }
            }
        }
    }
    
}
