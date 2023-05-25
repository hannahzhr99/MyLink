////
////  ContentView.swift
////  cobacobamap
////
////  Created by Hannah's Mac on 22/05/23.
////

//
//import MapKit
//import SwiftUI
//import CoreData
//
//struct ContentView: View {
//        @StateObject private var viewModel =  ContentViewModel()
//    @StateObject var locationManager = LocationManager()
//    
//     
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -6.301923393645343, longitude: 106.65259438229438),
//                                                   span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
//    var body: some View {
////        Map(coordinateRegion: $region, showsUserLocation: true)
////            .ignoresSafeArea()
//        Text("hello world")
////                MapView()
////                    .environmentObject(locationManager)
//        
//
//    }
//}
//  
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }
//
//final class ContentViewModel: ObservableObject {
//    
//    var locationManager: CLLocationManager?
//    
//    func checkIfLocationServicesIsEnabled() {
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager = CLLocationManager()
//            
//        } else {
//            print("Show an alert letting them know this is off and to go turn it on.")
//        }
//    }
//    
//    func checkLocationAuthorization() {
//        guard let locationManager = locationManager else { return }
//        
//        switch locationManager.authorizationStatus{
//            
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            print("your location is restricted likely due to parental controls.")
//        case .denied:
//            print("you have denied this app location permission. go into settings to change it.")
//        case .authorizedAlways, .authorizedWhenInUse:
//            break
//        @unknown default:
//            break
//        }
//    }
//}

import CoreLocationUI
import MapKit
import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State var destination: String = ""
    @State var searchresultopen: Bool = false
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -6.301275723658521, longitude: 106.65313628889636), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State var mapView = MKMapView()
    @State private var annotations = [
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.301275723658521, longitude: 106.65313628889636), title: "The Breeze"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.3021288399689785, longitude: 106.65124588037023), title: "Sinar Mas Land"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.32084247949462, longitude: 106.64364252576979), title: "Terminal Intermoda"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.303551348834457, longitude: 106.65013956132293), title: "CBD Timur")
    ]
    
    var body: some View {
        
            ZStack () {
                //show map and annotations
//                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
//                    .ignoresSafeArea()
//                Map(coordinateRegion: $region, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
//                    annotationItems: annotations) { annotation in
//                    MapAnnotation(coordinate: annotation.coordinate) {
//                        VStack {
//                            Text(annotation.title)
//                                .font(.headline)
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
//                            Image(systemName: "mappin.circle.fill")
//                                .foregroundColor(.black)
//                                .font(.title)
//                        }
//                    }
//                }.edgesIgnoringSafeArea(.all)
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .onAppear {
                        viewModel.requestAuthorization()
                    }
                
                
                VStack (alignment: .trailing) {
                    //location button
                    LocationButton(.currentLocation) {
                        viewModel.requestAllowOnceLocationPermission()
                    }
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    .labelStyle(.iconOnly)
                    .symbolVariant(.fill)
                    .tint(Color("PO-500"))
                    .padding(.bottom, 50)

                    Spacer()
                    
                    //searchbar
                    HStack(spacing: 20) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading)
                            .foregroundColor(Color("PO-500"))
                        TextField("Where do you want to go?", text: $destination)
                            .accentColor(Color(UIColor.systemGray))
                            .onChange(of: destination) {newValue in
                                searchresultopen = (newValue != "")
                            }

                    }
                    .frame(width: 358, height: 50).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))

                    if searchresultopen {
                        // list searchbar
                        ScrollView {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(locations) { place in
                                    VStack(alignment: .leading, spacing: -0) {
                                        VStack(alignment: .leading, spacing: 1) {
                                            HStack {
                                                Text(place.namaRute)
                                                    .font(.system(size: 14))
                                                //                                        Text("\(place.place.locality ?? ""), \(place.place.country ?? "")")
                                                //                                            .opacity(0.7)
                                                //                                            .font(.system(size: 12))
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .padding(.horizontal)
                                                    .font(.system(size: 14))
                                                    .foregroundColor(Color(UIColor.systemGray))
                                            }
                                            .padding(.leading, 16)
                                            .padding(.vertical, 16)
                                            .foregroundColor(.black)
                                            .onTapGesture {
                                            }
                                            .background(RoundedRectangle(cornerRadius: 6)
                                                .foregroundColor(.white))
                                            Spacer()
                                                .frame(height: 0)
                                        }
                                        .frame(alignment: .leading)
                                        .transition(.opacity)
                                    }
                                }
                                .frame(width: 358)

                            }
                            //                        .frame(alignment: .leading)
                        }
                        .frame(height: 200)
                        Spacer()
                    }
                }
            }
        
    }
    
    //recenter location
    func recenterMap() {
//        guard let _ = region else {
//            return
//        }
        mapView.setRegion(region, animated: true)
//        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    //current user's location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("UpdatingLocation")
        guard let location = locations.last else {
            return
        }

        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        self.mapView.setRegion(self.region, animated: true)
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
    
    //search results
    var searchResults: [Location] {
//        if destination.isEmpty {
//            return locations
//        } else {
//            return locations.filter { $0.destinationPoint.contains(destination) }
//        }
        return []
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        
        @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40, longitude: 120), span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
        
        @Published var currentPosition: CLLocation?
        
        private var locationManager: CLLocationManager
        
        override init() {
            print("inting")
            locationManager = CLLocationManager()
            
            super.init()
            print("inti 2222")
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
        
        func requestAllowOnceLocationPermission() {
            locationManager.requestLocation()
        }
        
        func requestAuthorization() {
            locationManager.requestWhenInUseAuthorization()
        }
        
        func startUpdatingLocation() {
            print("start updating location")
            locationManager.startUpdatingLocation()
        }
        
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            if let latestLocation = locations.last {
//                print("Updating Location")
//                print(latestLocation)
//                currentPosition = latestLocation
//                print(latestLocation)
//            }
            
            return
            
//            DispatchQueue.main.async {
//
//                self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error.localizedDescription)
        }
    }
    
}
