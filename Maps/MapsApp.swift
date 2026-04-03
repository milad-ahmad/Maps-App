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
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
        .modelContainer(sharedModelContainer)
    }
}
