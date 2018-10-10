// swift-tools-version:4.2
//
//  CacheLRU.swift
//  CacheLRU
//
//  Created by Bruno Fernandes on 23/10/15.
//  Copyright © 2017 bfernandesbfs. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "CacheLRU",
    products: [
        .library(
            name: "CacheLRU",
            targets: ["CacheLRU"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "CacheLRU",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "CacheLRUTests",
            dependencies: ["CacheLRU"],
            path: "Tests")
    ]
)
