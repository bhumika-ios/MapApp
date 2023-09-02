//
//  ContentView.swift
//  MapApp
//
//  Created by Bhumika Patel on 02/09/23.
//

import SwiftUI
import MapKit
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion (
        center: CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    let locations = [
    Location (name: "Adajan", coordinate: CLLocationCoordinate2D(latitude:
                                                                    21.192572 , longitude: 72.799736)),
    Location (name: "AirPort", coordinate: CLLocationCoordinate2D (latitude:
                                                                    21.1172611976, longitude: 72.7404853714))
    ]
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate){
                    NavigationLink{
                        Text(location.name)
                    } label: {
                        Text(location.name)
                            .foregroundColor(.red)
                    }
                  
                       
                    
                }
            }
            .ignoresSafeArea(.all)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
