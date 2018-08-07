# Instance
An easy way to get an instance of an object and reusable view from Nib or Storyboard

# P.S Readme will updated soon.

[![CI Status](https://img.shields.io/travis/SeRG1k17/Instance.svg?style=flat)](https://travis-ci.org/SeRG1k17/Instance)
[![Version](https://img.shields.io/cocoapods/v/Instance.svg?style=flat)](https://cocoapods.org/pods/Instance)
[![License](https://img.shields.io/cocoapods/l/Instance.svg?style=flat)](https://cocoapods.org/pods/Instance)
[![Platform](https://img.shields.io/cocoapods/p/Instance.svg?style=flat)](https://cocoapods.org/pods/Instance)
[![Language: Swift 3 & 4](https://img.shields.io/badge/Swift-3%20%26%204-orange.svg)](https://swift.org)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

|  Swift Version |  Instance Version  |
|----------------|--------------------|
|       4.0      |        0.1.1     |

## Introduction

Самый простой путь получения переиспользуемых экземлеров отовсуду.
Преимущества:
Максимально простой и короткий синтаксис.
Расширяемость(смотрите пример)
Нет фатальных ошибок.
Нет приведения типа.
Нет жесткого извлечения опционалов.
Нет дополнительного кода.


**Table of Contents**
* [UIViewControllers](#uiviewcontrollers)
* [UIView](#uiview)
* [UITableViewCell](#uitableviewcell)
* [UICollectionViewCell](#uicollectionviewcell)
* [UIReusableViewCell](#uireusableviewcell)


---

### Instance of `UIViewController`

1. Если имя контроллера совпадает с именем сториборда:
```swift
let vc = CustomViewController.instance() //vc has type CustomViewController
```
2. Если имя контроллера **не** совпадает с именем сториборда(если контроллер не начальный, требуется указать его идентификтор):
```swift
let vc = CustomViewController.instance(from: "MyStoryboard")
```
В данной реализации присутствует проблема в виду хард-код строки, для того, чтобы избежать этого.
3. Можно реализовать протокол `Instanceable`:
```swift
public protocol Instanceable {

var name: String { get }
var bundle: Bundle { get } //Property has default value Bundle.main
}
```


## Installation

Instance is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Instance'
```

## Author

Sergey Pugach, serg1k@icloud.com

## License

Instance is available under the MIT license. See the [LICENSE](https://github.com/SeRG1k17/Instance/blob/master/LICENSE) file for more info.
