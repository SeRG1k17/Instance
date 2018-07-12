//
//  ResourceType.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import Foundation

enum ResourceType: String {
    
    case nib = "nib"
    case storyboard = "storyboardc"
}

func exist(by name: String, in bundle: Bundle?, of type: ResourceType) -> Bool {
    
    let bundle = bundle ?? Bundle.main
    return bundle.path(forResource: name, ofType: type.rawValue) != nil
}
