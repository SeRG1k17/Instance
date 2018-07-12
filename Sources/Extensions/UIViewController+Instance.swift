//
//  UIViewController+Instance.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    @objc class var name: String {
        return String(describing: self)
    }
    
    class func instance(from storyboardable: Instanceable,
                        bundle storyboardBundleOrNil: Bundle? = nil,
                        withIdentifier identifier: String? = nil) -> Self {
        
        return instance(from: storyboardable.name, bundle: storyboardBundleOrNil, controllerIdentifier: identifier)
    }
    
    class func instance(from storyboardName: String? = nil,
                        bundle storyboardBundleOrNil: Bundle? = nil,
                        controllerIdentifier: String? = nil) -> Self {
        
        let storyboardName = storyboardName ?? name
        
        if exist(by: storyboardName, in: storyboardBundleOrNil, of: .storyboard) {
            
            let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundleOrNil)
            return storyboard.controller(withIdentifier: controllerIdentifier)
            
        } else {
            return xibInstance(from: storyboardName, bundle: storyboardBundleOrNil)
        }
    }
    
    
    //MARK: - In the current storyboard
    
    func instance<T: UIViewController>(of instanceable: Instanceable) -> T {
        return instance(for: instanceable.name)
    }
    
    func instance<T: UIViewController>(of controllerType: T.Type) -> T {
        return instance(for: controllerType.name)
    }
    
    func instance<T: UIViewController>(for controllerId: String) -> T {
        return storyboard?.controller(withIdentifier: controllerId) ?? T()
    }
    
    //MARK: - Xib
    
    class func xibInstance(from instanceable: Instanceable) -> Self {
        return xibInstance(from: instanceable.name, bundle: instanceable.bundle)
    }
    
    class func xibInstance(from nibName: String? = nil,
                           bundle nibBundleOrNil: Bundle? = nil) -> Self {
        
        return controller(from: nibName ?? name, bundle: nibBundleOrNil)
    }
    
    private static func controller<T: UIViewController>(from nibName: String,
                                                        bundle nibBundleOrNil: Bundle?) -> T {
        
        guard exist(by: nibName, in: nibBundleOrNil, of: .nib) else {
            return T()
        }
        
        return T.init(nibName: nibName, bundle: nibBundleOrNil)
    }
}
