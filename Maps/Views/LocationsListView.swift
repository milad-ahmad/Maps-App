//
//  LocationsListView.swift
//  Maps
//
//  Created by Milad Ahmad on 12/02/2026.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.goToNextLocation(location: location)
                } label: {
                    showLocationsList(location: location)
                }

            }
        
        }
        .listStyle(.plain)
    }
}

extension LocationsListView {
    
    public func showLocationsList(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(location.name)
                    Text(location.cityName)
                }
                .font(.headline)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
    }
}




#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
