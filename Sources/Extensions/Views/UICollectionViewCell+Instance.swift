//
//  UICollectionViewCell+Instance.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    
    //MARK: - Register
    
    class func registerNib(for collectionView: UICollectionView,
                           nibName: String? = nil,
                           bundle bundleOrNil: Bundle? = nil,
                           forCellWithReuseIdentifier identifier: String? = nil) {
        
        let nibName = nibName ?? name
        
        guard exist(by: nibName, in: bundleOrNil, of: .nib) else { return }
        
        let nib = UINib(nibName: nibName, bundle: bundleOrNil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier ?? name)
    }
    
    class func registerClass(for collectionView: UICollectionView,
                             forCellWithReuseIdentifier identifier: String? = nil) {
        
        collectionView.register(self, forCellWithReuseIdentifier: identifier ?? name)
    }
    
    
    //MARK: - Dequeue
    
    class func dequeue(from colletionView: UICollectionView,
                       withReuseIdentifier identifier: String? = nil,
                       for indexPath: IndexPath) -> Self {
        
        return _dequeue(from: colletionView, withReuseIdentifier: identifier ?? name, for: indexPath)
    }
    
    
    private class func _dequeue<T: UICollectionViewCell>(from colletionView: UICollectionView,
                                                         withReuseIdentifier identifier: String,
                                                         for indexPath: IndexPath) -> T {
        
        let cell = colletionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
        return cell ?? T()
    }
}
