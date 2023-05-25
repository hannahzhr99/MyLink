//
//  LocationViewModel.swift
//  RidingBuddiesTwo
//
//  Created by Rajif Afif on 23/05/23.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation


struct LocationPlace: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    let type: String?
}

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager
    
    @Published var currentLocation: CLLocation?
    @Published var currentHeading: CLHeading?
    @Published var locationPlaces: [LocationPlace] = []
    @Published var searchNearestLocationIsLoading: Bool = false
    
    @Published var searchResults: [LocationPlace] = []
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingHeading()
    }
    
    func requestAuthorization() {
        print("requestWhenInUse")
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            startUpdatingLocation()
        } else {
            stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Updating location")
        if let location = locations.last {
            currentLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        currentHeading = newHeading
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
}
