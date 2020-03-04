//
//  UIButton+Style.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-02.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit

extension UIButton {

    func applyRoundButtonStyle(color: UIColor) {
        backgroundColor = color
        layer.cornerRadius = 25.0
        tintColor = UIColor.white
    }
}
