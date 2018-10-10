//
//  CacheLRU.swift
//  CacheLRU
//
//  Created by Bruno Fernandes on 02/10/17.
//  Copyright © 2017 bfernandesbfs. All rights reserved.
//

import Foundation

/**
 CacheLRU - Discards the least recently used items first. This algorithm requires keeping track of what was used when, which is expensive if one wants to make sure the algorithm always discards the least recently used item
 */

public final class CacheLRU<Key: Hashable, Value> {

    private struct CachePayload {
        let key: Key
        let value: Value
    }

    private let capacity: Int
    private let list = DoublyLinkedList<CachePayload>()
    private var nodesDict = [Key: DoublyLinkedListNode<CachePayload>]()

    /**
     Initialize CacheLRU with specific capacity to alloc in memory

     - Parameter capacity: (Int) number of max item.
     */
    public init(capacity: Int) {
        self.capacity = max(0, capacity)
    }

    /**
     Store value in memory

     - Parameter value: The value to store in cache.
     - Parameter key: The Key that represent value store.
     */
    public func setValue(_ value: Value, for key: Key) {
        let payload = CachePayload(key: key, value: value)

        if let node = nodesDict[key] {
            node.payload = payload
            list.moveToHead(node)
        } else {
            let node = list.addHead(payload)
            nodesDict[key] = node
        }

        if list.count > capacity {
            let nodeRemoved = list.removeLast()
            if let key = nodeRemoved?.payload.key {
                nodesDict[key] = nil
            }
        }
    }

    /**
     Get value in storage with specific key

     - Parameter key: The Key to value storage
     */
    public func getValue(for key: Key) -> Value? {
        guard let node = nodesDict[key] else { return nil }

        list.moveToHead(node)

        return node.payload.value
    }

    /**
     Remove all values in storage
     */
    public func removeAll() {

        nodesDict.removeAll()
        for _ in 0..<list.count {
            _ = list.removeLast()
        }
    }
}
