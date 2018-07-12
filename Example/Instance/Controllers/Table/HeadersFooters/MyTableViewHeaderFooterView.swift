//
//  MyTableViewHeaderFooterView.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import UIKit

class MyTableViewHeaderFooterView: UITableViewHeaderFooterView, ViewInstanceType {

    @IBOutlet weak var positionLabel: UILabel?
    var typeLabel: UILabel?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        
        createTypeLabel(to: self)
        typeLabel?.text = "From xib"
    }
}
