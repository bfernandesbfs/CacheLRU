//
//  CacheLRUSpec.swift
//  CacheLRU
//
//  Created by Bruno Fernandes on 04/10/16.
//  Copyright © 2017 bfernandesbfs. All rights reserved.
//

@testable import CacheLRU
import Nimble
import Quick

// swiftlint:disable implicitly_unwrapped_optional

class CacheLRUSpec: QuickSpec {

    override func spec() {

        describe("CacheLRUSpec") {

            context("add values", {

                var cache: CacheLRU<Int, String>!

                beforeEach {
                    cache = CacheLRU<Int, String>(capacity: 2)
                }

                it("set value storage") {

                    cache.setValue("One", for: 1)
                    cache.setValue("Eleven", for: 11)

                    expect(cache.getValue(for: 1)) == "One"
                    expect(cache.getValue(for: 11)) == "Eleven"

                }
            })

            context("cache capacity", {

                var cache: CacheLRU<Int, String>!

                beforeEach {
                    cache = CacheLRU<Int, String>(capacity: 2)
                }

                it("set more values to storage") {

                    cache.setValue("One", for: 1)
                    cache.setValue("Eleven", for: 11)
                    cache.setValue("Twenty", for: 20)

                    expect(cache.getValue(for: 1)).to(beNil())

                }
            })

            context("add an key that exist", {

                var cache: CacheLRU<Int, String>!

                beforeEach {
                    cache = CacheLRU<Int, String>(capacity: 3)
                    cache.setValue("One", for: 1)
                    cache.setValue("Eleven", for: 11)
                    cache.setValue("Twenty", for: 20)
                }

                it("set more values to storage") {

                    cache.setValue("New", for: 1)

                    expect(cache.getValue(for: 1)) == "New"
                }
            })

            context("cache min capacity ", {

                var cache: CacheLRU<Int, String>!

                beforeEach {
                    cache = CacheLRU<Int, String>(capacity: 1)
                    cache.setValue("One", for: 1)
                }

                it("set more values to storage") {
                    cache.removeAll()
                    expect(cache.getValue(for: 1)).to(beNil())
                }
            })

        }
    }

}
