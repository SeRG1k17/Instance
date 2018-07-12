//
//  MyStoryboard.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import UIKit
import Instance

enum MyStoryboard: Instanceable {
    
    case second
    
    case type(UIViewController.Type)
    case name(String)
    
    var name: String {
        
        switch self {
        case let .type(type): return type.name
        case let .name(name): return name
            
        default: return String(describing: self).capitalized
        }
    }
}
