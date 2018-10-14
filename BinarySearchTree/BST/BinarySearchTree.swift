//
//  BinarySearchTree.swift
//  BST
//
//  Created by Piotr Błachewicz on 14/10/2018.
//  Copyright © 2018 Piotr Błachewicz. All rights reserved.
//

import Foundation

class BinarySearchTree<Key: Comparable, Value> {
    
    private var root: Node<Key, Value>
    
    init(_ root: Node<Key, Value>) {
        self.root = root
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return get(key: key)
        }
        set {
            if let value = newValue {
                put(key: key, value: value)
            } else {
                delete(key: key)
            }
        }
    }
}

//MARK: - Insert
extension BinarySearchTree {
    
    func put(key: Key, value: Value) {
        root = put(node: root, key: key, value: value)
    }
    
    func put(node: Node<Key, Value>?, key: Key, value: Value) -> Node<Key, Value> {
        guard let aNode = node else {
            return Node<Key, Value>(key: key, value: value)
        }
        
        if key < aNode.key {
            aNode.left = put(node: aNode.left, key: key, value: value)
        } else if key > aNode.key {
            aNode.right = put(node: aNode.right, key: key, value: value)
        } else {
            aNode.value = value
        }
        
        return aNode
    }
}

//MARK: Delete
extension BinarySearchTree {
    
    public func delete(key: Key) {
        if let aRoot = delete(node: root, key: key) {
            root = aRoot
        }
    }
    
    public func deleteMin() {
        if let aRoot = deleteMin(node: root) {
            root = aRoot
        }
    }
    
    public func deleteMax() {
        if let aRoot = deleteMax(node: root) {
            root = aRoot
        }
    }
    
    private func deleteMin(node: Node<Key, Value>) -> Node<Key, Value>? {
        guard let leftNode = node.left else {
            return node.right
        }
        
        node.left = deleteMin(node: leftNode)
        
        return node
    }
    
    private func deleteMax(node: Node<Key, Value>) -> Node<Key, Value>? {
        guard let rightNode = node.right else {
            return node.left
        }
        
        node.right = deleteMax(node: rightNode)
        
        return node
    }
    
   private func delete(node: Node<Key, Value>?, key: Key) -> Node<Key, Value>? {
        guard var aNode = node else {
            return nil
        }
        
        if key < aNode.key {
            aNode.left = delete(node: aNode.left, key: key)
        } else if key > aNode.key {
            aNode.right = delete(node: aNode.right, key: key)
        } else {
            guard let rightNode = aNode.right else {
                return aNode.left
            }
            
            guard let leftNode = aNode.left else {
                return aNode.right
            }
            
            aNode = min(node: rightNode)
            aNode.right = deleteMin(node: rightNode)
            aNode.left = leftNode
        }
        
        return aNode
    }
}

//MARK: - Search
extension BinarySearchTree {
    
    public func get(key: Key) -> Value? {
        return get(node: root, key: key)
    }
    
    private func get(node: Node<Key,Value>?, key: Key) ->Value? {
        guard let aNode = node else {
            return nil
        }
        
        if key < aNode.key {
            return get(node: aNode.left, key: key)
        } else if key > aNode.key {
            return get(node: aNode.right, key: key)
        } else {
            return aNode.value
        }
    }
}

//MARK: - Min
extension BinarySearchTree {
    
    private func min(node: Node<Key, Value>) -> Node<Key, Value> {
        guard let leftNode = node.left else {
            return node
        }
        
        return min(node: leftNode)
    }
}

//MARK: - Max
extension BinarySearchTree {
    
    private func max(node: Node<Key, Value>) -> Node<Key, Value> {
        guard let rightNode = node.right else {
            return node
        }
        return max(node: rightNode)
    }
}
