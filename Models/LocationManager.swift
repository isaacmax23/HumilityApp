//
//  LocationManager.swift
//  HumilityApp
//
//  Created by Isaac M Durairaj on 7/16/22.
//

import Foundation
import CoreLocation
import MapKit
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var region = MKCoordinateRegion()
    @Published var location: CLLocationCoordinate2D?
    var endViewModel = EndViewModel()
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        region =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                }
    
    
    func updateRegion()
    {
        region =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location!.latitude, longitude: location!.longitude), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
                 
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last?.coordinate
        updateRegion()
        endViewModel.setLocation(location: location ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
    }
}
