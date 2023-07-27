//
//  ViewController.swift
//  iOS.Swift
//
//  Created by zk on 2023/6/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        test1()
        
//        func mult(_ num: Int) -> (Int) -> Int {
//            return { val in
//                return num * val
//            }
//        }
//        var a = mult(2)(2)
//        var b: Set<Int> = Set()
//        b.insert(1)
        
        Sort.init().sort()
        print(Backtrace.letterCombinations("23"))
        print(Greedy.candy([1,0,2]))
        print(Greedy.maxArea([1,8,6,2,5,4,8,3,7]))
        print(DynamicProgram.longestCommonSubsequence("abcde", "ace"))
        print(DynamicProgram.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
        print(TDArray.findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]]))
        print(TDArray.spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
        print(TDArray.generate(5))
        print(DynamicProgram.isMatch("mississippi",
                                     "mis*is*p*."))
        
        print(Partation.findMedianSortedArrays([1,2], [3,4]))
        print(SlideWindow.lengthOfLongestSubstring("abcabcbb"))
        print(SlideWindow.maxScore([1,2,3,4,5,6,1], 3))
        print(SlideWindow.longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))
        print(SlideWindow.longestSubarray([4,2,2,2,4,4,4,4,2,2], 0))
        print(SlideWindow.minWindow("bba", "ab"))
    }
    
    enum Answer {
        case right, wrong
    }
    
    /**
        文档注释
        加一
     - Note: num是参数标签 也可以用`_`表示省略标签
     - Returns: +1
     - Parameter a: a
    */

    func f(num a: Int) -> Int {
        a + 1
    }
    

    
    func test1() {
        func exec(v1: Int, v2: Int, fn: (Int, Int) -> Int) {
            print(fn(v1, v2))
        }
        
        exec(v1: 1, v2: 2) {
            $0 + $1
        }
        
        func exe(fn: (Int, Int) -> Int) {
            print(fn(1, 2))
        }
        exe{$0 + $1}
        
        
//        struct Point {
//            var x: Int
//            var y: Int
//        }
//
//        class Size {
//            var x: Int
//            var y: Int
//            init(x: Int, y: Int) {
//                self.x = x
//                self.y = y
//            }
//        }
//        let p = Point(x: 1, y: 2)
////        p = Point() // Cannot assign to value: 'p' is a 'let' constant
////        p.x = 3 // Cannot assign to property: 'p' is a 'let' constant
////        p.y = 4 // Cannot assign to property: 'p' is a 'let' constant
//        let s = Size(x: 1, y: 2)
////        s = Size(x: 3, y: 4) // Cannot assign to value: 's' is a 'let' constant
//        s.x = 3
//        s.y = 4
        
//        class Point {
//            var x: Int
//            var y: Int
//            init() {
//                x = 0
//                y = 0
//            }
//        }
//        var a = Point()
        
  
//        struct Point {
//            var x: Int
//            var y: Int
//            init() {
//                x = 0
//                y = 0
//            }
//            init(x: Int, y: Int) {
//                self.x = x
//                self.y = y
//            }
//        }
        
        
//        var age: Int?// 默认值是nil
//        age = 20
//        print("My age is \(age ?? 0)")
        
        
//        enum Grade: String {
//            case perfect = "A"
//            case great = "B"
//            case good = "C"
//            case bad = "D"
//        }
//
//        print(Grade.perfect) // perfect
//        print(Grade.perfect.rawValue) // A
        
        
//        func swapValues(_ v1: inout Int, _ v2: inout Int) {
//            (v1, v2) = (v2, v1)
//        }
//
//        var n1 = 1
//        var n2 = 2
//        swapValues(&n1, &n2)
        
//        let answer = Answer.right
//        switch answer {
//        case .right:
//            print("right")
//        case .wrong:
//            print("wrong")
//        }
//
//        let a = "a"
//        switch a {
//        case "a", "b": // 复合条件（或者使用fallthrough）
//            print("a")
//        default:
//            print("false")
//        }
        
        
//        let tuple = (1, "a")
//        print("tuple is \(tuple.0) and \(tuple.1)")
//
//        let tuple2 = (num: 2, sting: "b")
//        print("tuple2 is \(tuple2.num) and \(tuple2.sting)")
//
//        var age = 1
//        if age == 0 {
//        } else if age == 1 {
//            print("age1:\(age)")
//        } else {
//        }
//
//        while age < 5 {
//            age = age + 1
//            print("age2:\(age)")
//        }
//
//        repeat {
//            age = age - 1
//            print("age3:\(age)")
//        } while age > 0
//
//        let range1 = 0...4 // ClosedRange<Int>
//        let range2 = 0..<4 // Range<Int>
//        let range3 = 0... // PartialRangeFrom<Int>
//        let range4 = ...4 // PartialRangeThrough<Int>
//        let stringRange = "cc"..."ff" // ClosedRange<String>
//
//        var array = [1,2,3,4,5]
//        for i in range1 {
//            print(array[i])
//        }
//        for num in array[0...4] {
//            print(num)
//        }
//        for num in array[...4] {
//            print(num)
//        }
//
//        for trick in stride(from: 1, to: 10, by: 2) {
//            print("stride from to:\(trick)")
//        }
//        for trick in stride(from: 1, through: 10, by: 2) {
//            print("stride from through:\(trick)")
//        }
//
//
//        let point = (1, 1)
//        switch point {
//        case let (x, y) where x == y :
//            print("x == y")
//        case let (x, y) where x == -y:
//            print("x == -y")
//        default:
//            print("x y")
//        }
//
//        let numbers = [1, -1, 2, -2]
//        for num in numbers where num > 0 {
//            print("num = \(num)")
//        }
        
    }
    

    
    

}

