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
}

