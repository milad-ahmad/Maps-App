//
//  LocationModel.swift
//  Maps
//
//  Created by Milad Ahmad on 01/02/2026.
//

import Foundation
import MapKit

struct Location: Identifiable {
    var id: String {
        name + cityName
    }
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}

