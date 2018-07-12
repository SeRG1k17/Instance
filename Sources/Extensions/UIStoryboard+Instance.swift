//
//  UIStoryboard+Instance.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    func controller<T: UIViewController>(withIdentifier controllerId: String?) -> T {
        
        if let identifier = controllerId,
            let vc = instantiateViewController(withIdentifier: identifier) as? T {
            return vc
            
        } else if let vc = instantiateInitialViewController() as? T {
            return vc
            
        } else if let vc = instantiateViewController(withIdentifier: T.name) as? T {
            return vc
            
        } else {
            return T()
        }
    }
}
