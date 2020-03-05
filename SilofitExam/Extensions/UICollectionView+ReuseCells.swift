//
//  SpaceCollectionViewCell.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-04.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

// Register & Reuse cell functionalities
extension UICollectionView {
    
    // MARK: - Cells
    func register<T: UICollectionViewCell>(nibFor: T.Type) {
        self.register(T.nib, forCellWithReuseIdentifier: T.uniqueIdentifier)
    }
    
    func register<T: UICollectionViewCell>(classFor: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.uniqueIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        T.hasNib ? register(nibFor: T.self) : register(classFor: T.self)
    }
    
    func reuse<T: UICollectionViewCell>(cell: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.uniqueIdentifier, for: indexPath) as? T else {
            preconditionFailure("Unble to dequeueReusableCell: \(type(of: T.self))")
        }
        return cell
    }
    
    // MARK: - Supplementary views
    
    func register<T: UICollectionReusableView>(nibFor: T.Type, forSupplementaryViewOfKind kind: String) {
        self.register(T.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.uniqueIdentifier)
    }
    
    func register<T: UICollectionReusableView>(class: T.Type, forSupplementaryViewOfKind kind: String) {
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.uniqueIdentifier)
    }
    
    func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind kind: String) {
        T.hasNib ? register(nibFor: T.self, forSupplementaryViewOfKind: kind) : register(class: T.self, forSupplementaryViewOfKind: kind)
    }
    
    func reuse<T: UICollectionReusableView>(_: T.Type,
                                            forSupplementaryViewOfKind kind: String,
                                            for indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableSupplementaryView(ofKind: kind,
                                                               withReuseIdentifier: T.uniqueIdentifier,
                                                               for: indexPath) as? T else {
                                                                preconditionFailure("Unble to dequeueReusableSupplementaryView: \(type(of: T.self))")
        }
        return cell
    }
}
