//
//  Space.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-02.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import Foundation

struct Space: Codable {
    let address: String
    let amenities: [String]
    let city: String
    let description: String
    let equipments: [String]
    let image_urls: [String]
    let latitude: Double
    let longitude: Double
    let max_capacity: Int
    let name: String
    let open_days: String
    let open_hours: String
    let rate: Int
    let slug: String
    let space_id: String
    let square_footage: Double
    let status: String
    let timezone: String // try TimeZone type
}
