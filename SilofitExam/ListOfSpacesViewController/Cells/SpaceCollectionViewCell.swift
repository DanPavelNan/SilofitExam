//
//  SpaceCollectionViewCell.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-04.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation

class SpaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availableSurfaceLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var distanceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        defaultSetup()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        defaultSetup()
    }

    private func defaultSetup() {
        imageView.image = UIImage(named: "placeholder-image.png")
        priceLabel.text = nil
        availableSurfaceLabel.text = nil
        capacityLabel.text = nil
        titleLabel.text = nil
        distanceLabel.text = nil
    }

    func configure(with space: Space, userCurrentLocation: CLLocation?) {
        if let firstImage = space.image_urls.first,
            let imageURL = URL(string: firstImage) {
        imageView.sd_setImage(with: imageURL)
        }
        priceLabel.text = space.pricePerHour
        availableSurfaceLabel.text = space.spaceInSquareFeet
        capacityLabel.text = space.peopleCapacity
        titleLabel.text = space.name

        if let userLocation = userCurrentLocation {
            let location = CLLocation(latitude: space.latitude, longitude: space.longitude)
            let distance = userLocation.distance(from: location)
            distanceLabel.text = String(format: " %.02f km away", distance / 1000)
        }
    }
}
