//
//  LocationsView.swift
//  Maps
//
//  Created by Milad Ahmad on 12/02/2026.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
        
    
   
    var body: some View {
    
               
        ZStack {
            Map(position: $vm.mapPosition)
            
            VStack(spacing: 0) {
                
              header
                    .padding()
                Spacer()
            }
            
        }
        
    }
}

private extension LocationsView {
    
    
    private var header: some View {
        VStack {
            Button {
                vm.toggleShowLocationList()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .fontWeight(.black)
                    .frame(height: 50)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .padding(.horizontal, 30)
                            .foregroundStyle(.black)
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
                   
            }

            if vm.showLocationList {
                LocationsListView()
            }
         
            
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: .black, radius: 10, x: 0, y: 0)
      
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
