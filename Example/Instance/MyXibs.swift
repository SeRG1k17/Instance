//
//  MyXibs.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import Foundation
import Instance

enum MyXibs: Instanceable {
    
    case someView
    case anotherView
    
    var name: String {
        switch self {
        case .someView: return "SomeView"
        case .anotherView: return "AnotherView"
        }
    }
}
