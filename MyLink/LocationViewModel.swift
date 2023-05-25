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
    
    func fetchNearestByString(queryString: String, completion: @escaping ([LocationPlace]) -> Void) {
        guard let currentLocation = currentLocation else {
            completion([])
            return
        }
        
        var locationPlaces: [LocationPlace] = []
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = queryString
        request.region = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let mapItems = response?.mapItems else {
                print("Error searching for locations: \(error?.localizedDescription ?? "")")
                completion([])
                return
            }
            
            locationPlaces = mapItems.compactMap { mapItem -> LocationPlace? in
//                print(MKMapItem.forCurrentLocation())
                let name = mapItem.name
                let latitude = mapItem.placemark.coordinate.latitude
                let longitude = mapItem.placemark.coordinate.longitude
                
                return LocationPlace(name: name ?? "", latitude: latitude, longitude: longitude, type: "")
            }
            
            completion(locationPlaces)
        }
    }
    
    func addToPlaces(locationPlaces: [LocationPlace]) {
        DispatchQueue.main.async {
            self.locationPlaces = locationPlaces
        }
    }
    
    func fetchNearestGasStations() {
        self.searchNearestLocationIsLoading = true
        var _ = fetchNearestByString(queryString: "gas station") { locationPlaces in
            let places = locationPlaces.compactMap { locationPlace -> LocationPlace? in
                // Add Type
                return LocationPlace(
                    name: locationPlace.name,
                    latitude: locationPlace.latitude,
                    longitude: locationPlace.longitude,
                    type: "gas-station")
            }
            
            self.addToPlaces(locationPlaces: places)
            self.searchNearestLocationIsLoading = false
        }
    }
    
    func fetchNearestMosque() {
        self.searchNearestLocationIsLoading = true
        var _ = fetchNearestByString(queryString: "Church") { locationPlaces in
            let places = locationPlaces.compactMap { locationPlace -> LocationPlace? in
                // Add Type
                return LocationPlace(
                    name: locationPlace.name,
                    latitude: locationPlace.latitude,
                    longitude: locationPlace.longitude,
                    type: "mosque")
            }
            
            self.addToPlaces(locationPlaces: places)
            self.searchNearestLocationIsLoading = false
        }
    }
    
    func fetchNearestMinimarket() {
        self.searchNearestLocationIsLoading = true
        var _ = fetchNearestByString(queryString: "indomaret") { locationPlaces in
            let places = locationPlaces.compactMap { locationPlace -> LocationPlace? in
                // Add Type
                return LocationPlace(
                    name: locationPlace.name,
                    latitude: locationPlace.latitude,
                    longitude: locationPlace.longitude,
                    type: "minimarket")
            }
            
            self.addToPlaces(locationPlaces: places)
            self.searchNearestLocationIsLoading = false
        }
    }
    
    func searchDestination(queryString: String){
        
//        DispatchQueue.main.async {
//            self.searchResults = []
//        }
//
        var _ = fetchNearestByString(queryString: queryString) { locationPlaces in
            let foundDestinations = locationPlaces.compactMap { locationPlace -> LocationPlace? in
                // Add Type
                return LocationPlace(
                    name: locationPlace.name,
                    latitude: locationPlace.latitude,
                    longitude: locationPlace.longitude,
                    type: "")
            }
            
            self.searchResults = foundDestinations
            
//            DispatchQueue.main.async {
//                self.searchResults = foundDestinations
//            }
        }
    }
}
