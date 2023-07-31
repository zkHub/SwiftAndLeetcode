//
//  LinkedList.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/31.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    class func arrayToListNode(_ array:[Int]) -> ListNode? {
        var pre: ListNode? = nil
        var head: ListNode? = nil
        for num in array {
            let node = ListNode(num)
            if pre != nil {
                pre?.next = node
            }
            if head == nil {
                head = node
            }
            pre = node
        }
        return head
    }
    class func listNodeToArray(_ listNode:ListNode?) -> [Int] {
        var array = [Int]()
        func nodeCheck(_ node:ListNode?) {
            if let node = node {
                array.append(node.val)
                nodeCheck(node.next)
            }
        }
        nodeCheck(listNode)
        return array
    }
    
}


class LinkedList {
    class func execute() {
        print(ListNode.listNodeToArray(LinkedList().reverseList(ListNode.arrayToListNode([1,2,3,4,5]))))
        print(ListNode.listNodeToArray(LinkedList().reverseList1(ListNode.arrayToListNode([1,2,3,4,5]))))
        print(ListNode.listNodeToArray(LinkedList().reverseBetween((ListNode.arrayToListNode([1,2,3,4,5])), 2, 4)))

    }
    // 206. 反转链表 https://leetcode.cn/problems/reverse-linked-list/
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let res = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return res
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
        }
        return pre
    }
    
    
    // 92. 反转链表 II https://leetcode.cn/problems/reverse-linked-list-ii/
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummyNode: ListNode? = ListNode()
        dummyNode?.next = head
        var pre = dummyNode
        
        for _ in 1..<left {
            pre = pre?.next
        }
        let cur = pre?.next
        for _ in left..<right {
            let temp = cur?.next?.next
            cur?.next?.next = pre?.next
            pre?.next = cur?.next
            cur?.next = temp
        }
        return dummyNode?.next
        
    }
    
}

