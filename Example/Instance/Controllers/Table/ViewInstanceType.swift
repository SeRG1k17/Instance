//
//  ViewInstanceType.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import UIKit

protocol ViewInstanceType: class {
    
    var positionLabel: UILabel? { get set }
    var typeLabel: UILabel? { get set }
}

extension ViewInstanceType {
    
    func createPositionLabel(to view: UIView) {
        
        let label = UILabel()
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        positionLabel = label
    }
    
    func createTypeLabel(to view: UIView) {
        
        let label = UILabel()
        label.textAlignment = .right
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        
        typeLabel = label
    }
}
