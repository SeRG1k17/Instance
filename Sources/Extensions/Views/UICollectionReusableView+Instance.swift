//
//  UICollectionReusableView+Instance.swift
//  Instance
//
//  Created by Sergey on 7/12/18.
//  Copyright © 2018 Sergey Pugach. All rights reserved.
//

import UIKit

public extension UICollectionReusableView {
    
    //MARK: - Register
    
    class func registerNib(for collectionView: UICollectionView,
                           forSupplementaryViewOfKindType kindType: SupplementaryViewOfKindType,
                           nibName: String? = nil,
                           bundle bundleOrNil: Bundle? = nil,
                           withReuseIdentifier identifier: String? = nil) {
        
        let nibName = nibName ?? name
        
        guard exist(by: nibName, in: bundleOrNil, of: .nib) else { return }
        
        let nib = UINib(nibName: nibName, bundle: bundleOrNil)
        collectionView.register(nib, forSupplementaryViewOfKind: kindType.value, withReuseIdentifier: identifier ?? name)
    }
    
    class func registerClass(for collectionView: UICollectionView,
                             forSupplementaryViewOfKindType kindType: SupplementaryViewOfKindType,
                             withReuseIdentifier identifier: String? = nil) {
        
        collectionView.register(self, forSupplementaryViewOfKind: kindType.value, withReuseIdentifier: identifier ?? name)
    }
    
    
    //MARK: - Dequeue
    
    class func dequeue(for colletionView: UICollectionView,
                       ofKind elementKind: String,
                       for indexPath: IndexPath,
                       withReuseIdentifier identifier: String? = nil) -> Self {
        
        return _dequeue(for: colletionView, ofKind: elementKind, for: indexPath, withReuseIdentifier: identifier ?? name)
    }
    
    private class func _dequeue<T: UICollectionReusableView>(for colletionView: UICollectionView,
                                                             ofKind elementKind: String,
                                                             for indexPath: IndexPath,
                                                             withReuseIdentifier identifier: String) -> T {
        
        let view = colletionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: identifier, for: indexPath) as? T
        
        return view ?? T()
    }
    
    
    //MARK: - Helpers
    
    enum SupplementaryViewOfKindType {
        case header, footer
        
        var value: String {
            switch self {
            case .header: return UICollectionElementKindSectionHeader
            case .footer: return UICollectionElementKindSectionFooter
            }
        }
        
        public init?(ofKind elementKind: String) {
            
            switch elementKind {
            case UICollectionElementKindSectionHeader: self = .header
            case UICollectionElementKindSectionFooter: self = .footer
            default: return nil
            }
        }
    }
}
