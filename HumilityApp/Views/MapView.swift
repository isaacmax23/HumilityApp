//
//  RegionView.swift
//  HumilityApp
//
//  Created by Isaac M Durairaj on 7/10/22.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {
    
    
    
    
    @StateObject var locationManager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow
    
    var body: some View {
        Text("")
        if let location = locationManager.location {
                       Text("Your location: \(location.latitude), \(location.longitude)")
            ZStack{
            Map(coordinateRegion: $locationManager.region, interactionModes: MapInteractionModes.all ,showsUserLocation: true, userTrackingMode: $tracking).edgesIgnoringSafeArea(.all)
                Button("+") {
                    locationManager.region.span.latitudeDelta *= 0.9
                    locationManager.region.span.longitudeDelta *= 0.9
                }.frame(width: 25, height: 25).foregroundColor(Color.white).background(Color.gray).offset(x: 170, y: 200)
                Button("-") {
                    locationManager.region.span.latitudeDelta /= 0.9
                    locationManager.region.span.longitudeDelta /= 0.9
                }.frame(width: 25, height: 25).foregroundColor(Color.white).background(Color.gray).offset(x: 170, y: 250)

            }
}
}
}
struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
