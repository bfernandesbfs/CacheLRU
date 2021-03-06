# CacheLRU

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/CacheLRU.svg)](https://cocoapods.org/pods/CacheLRU)

[![Travis](https://img.shields.io/travis/bfernandesbfs/CacheLRU/master.svg)](https://travis-ci.org/bfernandesbfs/CacheLRU/branches)
[![SwiftFrameworkTemplate](https://img.shields.io/badge/SwiftFramework-Template-red.svg)](http://github.com/RahulKatariya/SwiftFrameworkTemplate)

### Simple implementation based in the algorithm LRU

Discards the least recently used items first. This algorithm requires keeping track of what was used when, which is expensive if one wants to make sure the algorithm always discards the least recently used item. General implementations of this technique require keeping "age bits" for cache-lines and track the "Least Recently Used" cache-line based on age-bits. In such an implementation, every time a cache-line is used, the age of all other cache-lines changes. LRU is actually a family of caching algorithms with members including 2Q by Theodore Johnson and Dennis Shasha, and LRU/K by Pat O'Neil, Betty O'Neil and Gerhard Weikum.

The access sequence for the below example is A B C D E D F.

![Screenshot](docs/lru_example.png)

In the above example once A B C D gets installed in the blocks with sequence numbers (Increment 1 for each new Access) and when E is accessed, it is a miss and it needs to be installed in one of the blocks. According to the LRU Algorithm, since A has the lowest Rank(A(0)), E will replace A.


- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 8.0+ / Mac OS X 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 10.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CacheLRU into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'CacheLRU', '~> 0.0.1'
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate CacheLRU into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "bfernandesbfs/CacheLRU" ~> 0.0.1
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use CacheLRU as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "HelloCacheLRU",
    dependencies: [
        .package(url: "https://github.com/bfernandesbfs/CacheLRU.git", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        .target(name: "HelloCacheLRU", dependencies: ["CacheLRU"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate CacheLRU into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add CacheLRU as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/bfernandesbfs/CacheLRU.git
$ git submodule update --init --recursive
```

- Open the new `CacheLRU` folder, and drag the `CacheLRU.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `CacheLRU.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `CacheLRU.xcodeproj` folders each with two different versions of the `CacheLRU.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `CacheLRU.framework`.

- And that's it!

> The `CacheLRU.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

## Usage

- Initialize Cache

``` swift

let cache = CacheLRU<Int, String>(capacity: 2)

```

- Set value in storage

``` swift

cache.setValue("One", for: 1)

```

- Get value in storage

``` swift

cache.getValue(for: 1)
// "One"

```

- Remove all value

``` swift

cache.removeAll()

```

## Contributing

Issues and pull requests are welcome!

## Author

Bruno Fernandes [@bfernandesbfs](https://twitter.com/bfernandesbfs)

## License

CacheLRU is released under the MIT license. See [LICENSE](https://github.com/bfernandesbfs/CacheLRU/blob/master/LICENSE) for details.
