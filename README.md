# LazyArray
> Array and list operations made lazy.

[![swift](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org)
[![travis](https://travis-ci.org/lucas34/LazyArray.svg?branch=master)](https://travis-ci.org/lucas34/LazyArray)
[![codecov](https://codecov.io/gh/lucas34/LazyArray/branch/master/graph/badge.svg)](https://codecov.io/gh/lucas34/LazyArray)
[![pod](https://img.shields.io/cocoapods/v/LazyArray.svg?style=flat)](https://cocoapods.org/pods/LazyArray)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![codebeat badge](https://codebeat.co/badges/29c646b0-6cea-46c3-955a-6d12a07da64f)](https://codebeat.co/projects/github-com-lucas34-lazyarray-master)

LazyArray is a standelon generic immutable list with O(1) only's methods.

- [x] Map: In Swift.Array, map function has a O(n) complexity. In LazyArray, the map will be applied on demande. 
- [x] Cache: Will cache result before returning. Great when you use the map operator

From Swift.Collection
- [x] Prefix, Suffix
- [x] first, last
- [x] dropFirst, dropLast

## Installation

#### Carthage
LazyArray is carthage compatible. Add the following entry in your Cartfile:

```
github "lucas34/LazyArray"
```

Then run `carthage update`.

#### CocoaPods
You can use [CocoaPods](https://cocoapods.org/pods/LazyArray) to install `LazyArray` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'LazyArray'
```

In your application, simply import the library

``` swift
import LazyArray
```

## Contributors

We would love you for the contribution to **LazyArray**, check the ``LICENSE`` file for more info.

* [Lucas Nelaupe](http://www.lucas-nelaupe.fr/) - [@lucas34990](https://twitter.com/lucas34990)

## Licence

Distributed under the MIT license. See ``LICENSE`` for more information.
