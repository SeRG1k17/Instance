//
//  Instanceable.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import Foundation

public protocol Instanceable {
    
    var name: String { get }
    var bundle: Bundle { get }
}

public extension Instanceable {
    
    var bundle: Bundle {
        return Bundle.main
    }
}
