
//
//  ShowMapView.swift
//  MyLink
//
//  Created by Hannah's Mac on 25/05/23.
//

import CoreLocationUI
import MapKit
import SwiftUI

struct ShowMapView: View {
//    @State private var path: [Int] = []
    @State private var mapUserTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -6.302139339689601,
                                       longitude: 106.6525568313703),
        latitudinalMeters: 500,
        longitudinalMeters: 500
    )
    @StateObject private var viewModel = LocationViewModel()
    
    @State var destination: String = ""
    @State var searchresultopen: Bool = false
    @State private var annotations = [
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.301275723658521, longitude: 106.65313628889636), title: "The Breeze"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.3021288399689785, longitude: 106.65124588037023), title: "Sinar Mas Land"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.32084247949462, longitude: 106.64364252576979), title: "Terminal Intermoda"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.303551348834457, longitude: 106.65013956132293), title: "CBD Timur"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.30939872109013, longitude: 106.65413146050821), title: "Digital Hub"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.284401091782833, longitude: 106.6384224266624), title: "QBig"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.299060881927586, longitude: 106.64794077917014), title: "Simpang Foresta"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.296656990873592, longitude: 106.64778256043407), title: "Foresta 1"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.301010955178777, longitude: 106.64156160594726), title: "Edutown"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.290948408725142, longitude: 106.63947179243117), title: "Gramedia"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.303118312163062, longitude: 106.64344916887462), title: "AEON Mall"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.31279872441556, longitude: 106.64261293114184), title: "Simplicity 1"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.289994925538211, longitude: 106.6496467863138), title: "Foresta 2"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.286964975481803, longitude: 106.64868937957759), title: "De Park"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.297476711867153, longitude: 106.636639995812), title: "ICE"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.290995340019762, longitude: 106.62835717284129), title: "The Mozia"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.302054051892119, longitude: 106.64206089427871), title: "CBD Barat"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.313544351874848, longitude: 106.64861733224951), title: "Verdant"),
        HalteBSDLink(coordinate: CLLocationCoordinate2D(latitude: -6.314610623016643, longitude: 106.64625046664761), title: "Eternity"),
    ]
    
    var searchResults: [Location] {
        if destination.isEmpty {
            return locations
        } else {
            return locations.filter { $0.destinationPoint.contains(destination) }
        }
    }
    
    var body: some View {
        
        NavigationView {
            ZStack () {
                Map(
                    coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: $mapUserTrackingMode,
                    annotationItems: annotations
                ) { annotation in
                    MapAnnotation(coordinate: annotation.coordinate) {
                        VStack {
                            Text(annotation.title)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .shadow(color: .white, radius: 0.5)
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(Color("PO-500"))
                                .font(.title)
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .trailing) {
                    //location button
                    LocationButton(.currentLocation) {
                        if let currentLocation = viewModel.currentLocation {
                            region = MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude),
                                latitudinalMeters: 750,
                                longitudinalMeters: 750
                            )
                        }
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
                                // list of filtered
                                ForEach(searchResults) { place in
                                    VStack(alignment: .leading, spacing: -0) {
                                        VStack(alignment: .leading, spacing: 1) {
                                            HStack {
                                                NavigationLink(destination: SuggestedPage(destination: place.destinationPoint, placeholder1: place.currentPoint, placeholder2: place.namaRute, placeholder3: place.namaRute, data: place)){
                                                    Text(place.destinationPoint)
                                                        .font(.system(size: 14))
                                                }
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
                                                print("clicked")
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
                        }
                        .frame(height: 200)
                        Spacer()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.requestAuthorization()
        }
        }
    }
}

struct ShowMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMapView()
    }
}
