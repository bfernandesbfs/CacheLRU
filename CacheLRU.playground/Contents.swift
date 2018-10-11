//: Playground - noun: a place where people can play

import CacheLRU

let cache = CacheLRU<Int, String>(capacity: 2)

cache.setValue("One", for: 1)
cache.setValue("Eleven", for: 11)
cache.setValue("Twenty", for: 20)

cache.getValue(for: 1)
// nil. We exceeded the capacity with the previous `setValue`  and `1` was the last element.

cache.getValue(for: 11)

cache.setValue("New", for: 11)

cache.getValue(for: 11)
