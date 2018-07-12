//
//  BorderButton.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    struct Constants {
        
        static let borderColor: UIColor = .gray
        static let borderWidth: CGFloat = 1.0
        static let cornerRadius: CGFloat = 8.0
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }

    func commonInit() {
        
        layer.borderColor = Constants.borderColor.cgColor
        layer.borderWidth = Constants.borderWidth
        
        layer.cornerRadius = Constants.cornerRadius
        
    }
}



