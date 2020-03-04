//
//  SpaceMapAnnotation.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-03.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import MapKit

class SpaceMapAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    let spaceId: String

    init(_ space: Space) {
        self.title = space.name
        self.locationName = space.address
        self.discipline = space.slug
        self.coordinate = CLLocationCoordinate2D(latitude: space.latitude, longitude: space.longitude)
        self.spaceId = space.space_id
        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}

