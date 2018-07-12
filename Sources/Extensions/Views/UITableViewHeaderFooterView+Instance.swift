//
//  UITableViewHeaderFooterView+Instance.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import UIKit

public extension UITableViewHeaderFooterView {
    
    //MARK: - Register
    
    class func registerNib(for tableView: UITableView,
                           nibName: String? = nil,
                           bundle bundleOrNil: Bundle? = nil,
                           forHeaderFooterViewReuseIdentifier identifier: String? = nil) {
        
        let nibName = nibName ?? name
        
        guard exist(by: nibName, in: bundleOrNil, of: .nib) else { return }
        
        let nib = UINib(nibName: nibName, bundle: bundleOrNil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier ?? name)
    }
    
    class func registerClass(for tableView: UITableView,
                             forHeaderFooterViewReuseIdentifier identifier: String? = nil) {
        
        tableView.register(self, forHeaderFooterViewReuseIdentifier: identifier ?? name)
    }
    
    //MARK: - Dequeue
    
    class func dequeue(from tableView: UITableView,
                       withIdentifier identifier: String? = nil) -> Self {
        
        return _dequeue(from: tableView, withIdentifier: identifier ?? name)
    }
    
    private class func _dequeue<T: UITableViewHeaderFooterView>(from tableView: UITableView,
                                                                withIdentifier identifier: String) -> T {
        
        guard
            isRegistered(for: tableView, withIdentifier: identifier),
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T
            else {
                return T()
        }
        
        return view
    }
}
