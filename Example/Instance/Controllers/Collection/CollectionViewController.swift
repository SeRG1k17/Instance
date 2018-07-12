//
//  CollectionViewController.swift
//  Instance
//
//  Created by Sergey on 7/11/18.
//  Copyright © 2018 Сергей Пугач. All rights reserved.
//

import UIKit
import Instance

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        XibCollectionReusableView.registerNib(for: collectionView, forSupplementaryViewOfKindType: .header)
        XibCollectionReusableView.registerNib(for: collectionView, forSupplementaryViewOfKindType: .footer)
        XibCollectionViewCell.registerNib(for: collectionView)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
            layout.sectionFootersPinToVisibleBounds = true
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = XibCollectionViewCell.dequeue(from: collectionView, for: indexPath)
        
        cell.label.text = "Item: \(indexPath.item), Section: \(indexPath.section)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let spacing = flowLayout.map { $0.minimumInteritemSpacing } ?? 0
        
        return CGSize(width: UIScreen.main.bounds.width / 2 - 2 * spacing , height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView = XibCollectionReusableView.dequeue(for: collectionView, ofKind: kind, for: indexPath)
        
        if let kindType = UICollectionReusableView.SupplementaryViewOfKindType(ofKind: kind) {
            
            reusableView.backgroundColor = kindType.color
            reusableView.label.text = "\(kindType.text)-Section: \(indexPath.section)"
        }
        
        return reusableView
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return sectionHeaderFooterSize(for: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return sectionHeaderFooterSize(for: collectionView)
    }
    
    func sectionHeaderFooterSize(for collectionView: UICollectionView) -> CGSize {
        
        let reusableView = XibCollectionReusableView.instance()
        return CGSize(width: collectionView.bounds.size.width , height: reusableView.bounds.size.height)
    }
}

private extension UICollectionReusableView.SupplementaryViewOfKindType {
    
    var color: UIColor {
        switch self {
        case .header: return .green
        case .footer: return .red
        }
    }
    
    var text: String {
        return String(describing: self).capitalized
    }
}
