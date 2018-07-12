//
//  MyTableViewCell.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, ViewInstanceType {

    var positionLabel: UILabel?
    var typeLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        
        createPositionLabel(to: contentView)
        createTypeLabel(to: contentView)
        
        typeLabel?.text = "From storyboard"
    }
}
