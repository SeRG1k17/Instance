//
//  Storyboardable.swift
//  Instance
//
//  Created by Sergey on 7/13/18.
//

import Foundation

public protocol Storybordable: Instanceable {
    var storyboardName: String { get }
}

public extension Storybordable {
    var name: String {
        return String(describing: self)
    }
}
