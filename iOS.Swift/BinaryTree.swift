//
//  BinaryTree.swift
//  iOS.Swift
//
//  Created by zk on 2023/7/28.
//

import Foundation



// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    class func creatTreeNode(_ rootIndex: Int, _ array: [Int?]) -> TreeNode? {
        if rootIndex >= array.count {
            return nil
        }
        if array[rootIndex] == nil {
            return nil
        }
        let treeNode = TreeNode(array[rootIndex]!)
        treeNode.left = creatTreeNode(rootIndex*2+1, array)
        treeNode.right = creatTreeNode(rootIndex*2+2, array)
        return treeNode
    }
    
 }



class BinaryTree {
    
    class func execute() {
        let treeNode = TreeNode.creatTreeNode(0, [-10,9,20,nil,nil,15,7])
        print(BinaryTree().maxPathSum(treeNode))
    }
    
    // 124. 二叉树中的最大路径和 https://leetcode.cn/problems/binary-tree-maximum-path-sum/
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        
        func bfs(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            let left = max(bfs(root.left), 0)
            let right = max(bfs(root.right), 0)
            maxSum = max(maxSum, left + root.val + right)
            return root.val + max(left, right)
        }
        bfs(root)
        return maxSum
    }
}
