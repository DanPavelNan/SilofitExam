//
//  Decimal+Formating.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-04.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import Foundation

extension Decimal {
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.locale = Locale.current

        return formatter.string(from: self as NSNumber) ?? "\(self)"
    }
}
