//
//  Node.swift
//  BST
//
//  Created by Piotr Błachewicz on 14/10/2018.
//  Copyright © 2018 Piotr Błachewicz. All rights reserved.
//

import Foundation

class Node <Key: Comparable, Value> {
    var key: Key
    var value: Value
    var left: Node?
    var right: Node?
    
    init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
}

