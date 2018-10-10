//
//  DoublyLinkedList.swift
//  CacheLRU
//
//  Created by Bruno Fernandes on 10/10/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import Foundation

typealias DoublyLinkedListNode<T> = DoublyLinkedList<T>.Node<T>

internal final class DoublyLinkedList<T> {

    final class Node<T> {
        var payload: T
        var previous: Node<T>?
        var next: Node<T>?

        init(payload: T) {
            self.payload = payload
        }
    }

    private(set) var count: Int = 0

    private var head: Node<T>?
    private var tail: Node<T>?

    internal func addHead(_ payload: T) -> Node<T> {
        let node = Node(payload: payload)
        defer {
            head = node
            count += 1
        }

        guard let head = head else {
            tail = node
            return node
        }

        head.previous = node

        node.previous = nil
        node.next = head

        return node
    }

    internal func moveToHead(_ node: Node<T>) {
        guard node !== head else { return }
        let previous = node.previous
        let next = node.next

        previous?.next = next
        next?.previous = previous

        node.next = head
        node.previous = nil

        if node === tail {
            tail = previous
        }

        self.head = node
    }

    internal func removeLast() -> Node<T>? {
        guard let tail = self.tail else { return nil }

        let previous = tail.previous
        previous?.next = nil
        self.tail = previous

        if count == 1 {
            head = nil
        }

        count -= 1

        return tail
    }
}
