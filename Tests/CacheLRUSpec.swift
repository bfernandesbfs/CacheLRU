//
//  CacheLRUSpec.swift
//  CacheLRU
//
//  Created by Bruno Fernandes on 04/10/16.
//  Copyright © 2017 bfernandesbfs. All rights reserved.
//

import Quick
import Nimble
@testable import CacheLRU

class CacheLRUSpec: QuickSpec {

    override func spec() {

        describe("CacheLRUSpec") {
            it("works") {
                expect(CacheLRU.name) == "CacheLRU"
            }
        }

    }

}
