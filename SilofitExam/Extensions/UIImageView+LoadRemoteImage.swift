//
//  UIImageView+LoadRemoteImage.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-05.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {

    func loadImage(withURL imageURL: URL) {
        sd_setImage(with: imageURL)
    }
}
