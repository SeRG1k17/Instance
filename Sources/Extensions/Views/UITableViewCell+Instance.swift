//
//  UITableViewCell+Dequeue.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import UIKit

public extension UITableViewCell {

    //MARK: - Register
    
    class func registerNib(for tableView: UITableView,
                           nibName: String? = nil,
                           bundle bundleOrNil: Bundle? = nil,
                           forCellReuseIdentifier identifier: String? = nil) {
        
        let nibName = nibName ?? name
        
        guard exist(by: nibName, in: bundleOrNil, of: .nib) else { return }
        
        let nib = UINib(nibName: nibName, bundle: bundleOrNil)
        tableView.register(nib, forCellReuseIdentifier: identifier ?? name)
    }
    
    class func registerClass(for tableView: UITableView,
                             forCellReuseIdentifier identifier: String? = nil) {
        
        tableView.register(self, forCellReuseIdentifier: identifier ?? name)
    }
    
    
    //MARK: - Dequeue
    
    class func dequeue(from tableView: UITableView,
                       for indexPath: IndexPath? = nil,
                       withIdentifier identifier: String? = nil) -> Self {
        
        return _dequeue(from: tableView, for: indexPath, withIdentifier: identifier ?? name)
    }
    
    
    private class func _dequeue<T: UITableViewCell>(from tableView: UITableView,
                                                    for indexPath: IndexPath?,
                                                    withIdentifier identifier: String) -> T {
        
        guard isRegistered(for: tableView, withIdentifier: identifier) else { return T() }
        
        if
            let indexPath = indexPath,
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T {
            return cell
            
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? T {
            return cell
            
        } else {
            return T()
        }
    }
}
