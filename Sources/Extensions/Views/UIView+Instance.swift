//
//  UIView+Instance.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import UIKit

public extension UIView {
    
    @objc class var name: String {
        return String(describing: self)
    }
    
    class func instance(from instanceable: Instanceable,
                        owner: Any? = nil,
                        options: [AnyHashable: Any]? = nil) -> Self {
        
        return _instance(from: instanceable.name, owner: owner, options: options, bundle: instanceable.bundle)
    }
    
    class func instance<T: UIView>(from nibType: T.Type? = nil,
                                   owner: Any? = nil,
                                   options: [AnyHashable: Any]? = nil,
                                   bundle: Bundle = Bundle.main) -> Self {
        
        return _instance(from: nibType?.name ?? name, owner: owner, options: options, bundle: bundle)
    }
    
    class func instance(from nibName: String,
                        owner: Any? = nil,
                        options: [AnyHashable: Any]? = nil,
                        bundle: Bundle = Bundle.main) -> Self {
        
        return _instance(from: nibName, owner: owner, options: options, bundle: bundle)
    }
    
    
    //MARK: - Helpers
    
    class func isRegistered(for tableView: UITableView,
                            withIdentifier identifier: String) -> Bool {
        
        return tableView.registeredNibs.keys.contains(identifier) ||
            tableView.registeredClasses.keys.contains(identifier)
    }
    
    
    //MARK: - Private
    
    private class func _instance<T: UIView>(from nibName: String,
                                            owner: Any?,
                                            options: [AnyHashable: Any]?,
                                            bundle: Bundle) -> T {
        
        guard exist(by: nibName, in: bundle, of: .nib) else {
            return T()
        }
        
        let view = bundle
            .loadNibNamed(nibName, owner: owner, options: options)?
            .first(where: { $0 is T }) as? T
        
        return view ?? T()
    }
}
