//
//  LocationsViewModel.swift
//  Maps
//
//  Created by Milad Ahmad on 12/02/2026.
//
import SwiftUI
import MapKit
internal import Combine

class LocationsViewModel: ObservableObject{
    
    @Published var mapLocation: Location {
        didSet {
            updateLocation(location: mapLocation)
        }
    }
    
    @Published var showLocationList: Bool = false
    
    @Published var mapPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
  
    @Published var locations: [Location]
    
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateLocation(location: locations.first!)
    }
    
    
    func updateLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapPosition = MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func toggleShowLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func goToNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
}
