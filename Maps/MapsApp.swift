//
//  MapsApp.swift
//  Maps
//
//  Created by Milad Ahmad on 01/02/2026.
//

import SwiftUI
import SwiftData

@main
struct MapsApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
