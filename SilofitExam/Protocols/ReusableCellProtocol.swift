//
//  SpaceCollectionViewCell.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-04.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

protocol ReusableCellProtocol: class {
    static var uniqueIdentifier: String { get }
    static var hasNib: Bool { get }
    static var nib: UINib { get }
}

extension ReusableCellProtocol {
    
    static var uniqueIdentifier: String {
        return String(describing: self)
    }
    
    private var uniqueIdentifier: String {
        return type(of: self).uniqueIdentifier
    }
    
    private static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    static var hasNib: Bool {
        return self.bundle.path(forResource: self.uniqueIdentifier, ofType: "nib") != nil
    }
    
    static var nib: UINib {
        return UINib(nibName: self.uniqueIdentifier, bundle: self.bundle)
    }
}

extension UICollectionReusableView: ReusableCellProtocol { }
extension UITableViewCell: ReusableCellProtocol { }
extension UITableViewHeaderFooterView: ReusableCellProtocol { }
