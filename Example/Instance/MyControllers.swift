//
//  MyControllers.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import Foundation
import Instance

enum MyControllers: Instanceable {
    
    case first, inCurrentSb
    var name: String {
        switch self {
        case .first: return "ViewController"
        case .inCurrentSb: return "InCurrentSbViewController"
        }
    }
}
