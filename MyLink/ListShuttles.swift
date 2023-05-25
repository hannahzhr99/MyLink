//
//  ListShuttles.swift
//  MyLink
//
//  Created by Hannah's Mac on 22/05/23.
//

import Foundation
import SwiftUI
import MapKit

struct Location: Identifiable, Hashable {
    var id = UUID()
    var namaRute: String
    var currentPoint: String
    var destinationPoint: String
    var rute: [String]
    var time: [[String]]
}

struct HalteBSDLink: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}

let locations = [
//    Location(name: "Terminal Intermoda", latitude: -6.32084247949462, longitude: 106.64364252576979, time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Simplicity 2", latitude: -6.312847381893577, longitude: 106.64259145343098, time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Edutown 1", latitude: -6.3022705057563435, longitude: 106.6417344669254, time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Edutown 2", latitude: -6.301193440914049, longitude: 106.64161644973821, time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "ICE 1", latitude: -6.297359406744566, longitude: 106.63663999576053, time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "ICE 2", latitude: -6.3018731718287455, longitude: 106.6353593194264,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "ICE 6", latitude: -6.299786396418275, longitude: 106.63536951071355,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "ICE 5", latitude: -6.2972727273168445, longitude: 106.6361614991667,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Froogy", latitude: -6.2970162239200285, longitude: 106.6405484677953,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Gramedia", latitude: -6.291012297883917, longitude: 106.63949704194854,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Astra", latitude: -6.289146054493612, longitude: 106.6393361094404,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Courts Mega Store", latitude: -6.286213372835997, longitude: 106.63886404069598,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Q Big 1", latitude: -6.284336447881372, longitude: 106.63843488726994,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Lulu", latitude: -6.280923839700317, longitude: 106.6363964084556,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Q Big 2", latitude: -6.280422610925172, longitude: 106.63650369664914,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Q Big 3", latitude: -6.283216688199628, longitude: 106.63780188581322,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "BCA", latitude: -6.2874824261500635, longitude: 106.6393361094558,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "FBL 2", latitude: -6.290948312475743, longitude: 106.63987255125798,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "FBL 1", latitude: -6.295811178600629, longitude: 106.6405270102628,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "GOP 1", latitude: -6.301402868116496, longitude: 106.64928386498688,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
    Location(namaRute: "Intermoda-De Park (Rute 1) Bus", currentPoint: "Sinar Mas Land", destinationPoint: "Terminal Intermoda", rute: ["Sinar Mas Land", "The Breeze", "CBD Timur", "SKY House AEON Mall", "CBD Barat", "Simplicity 1", "Terminal Intermoda"], time: [["10.00", "12.00", "14.00", "16.00", "18.00", "20.00", "22.00"],["10.05", "12.05", "14.05", "16.05", "18.05", "20.05", "22.05"],["10.10", "12.10", "14.10", "16.10", "18.10", "20.10", "22.10"],["10.15", "12.15", "14.15", "16.15", "18.15", "20.15", "22.15"],["10.20", "12.20", "14.20", "16.20", "18.20", "20.20", "22.20"],["10.25", "12.25", "14.25", "16.25", "18.25", "20.25", "22.25"],["10.30", "12.30", "14.30", "16.30", "18.30", "20.30", "22.30"]]),
    Location(namaRute: "Intermoda-De Park (Rute 1) Bus", currentPoint: "The Breeze", destinationPoint: "Terminal Intermoda", rute: ["The Breeze", "CBD Timur", "SKY House AEON Mall", "CBD Barat", "Simplicity 1", "Terminal Intermoda"], time: [["10.00", "12.00", "14.00", "16.00", "18.00", "20.00"],["10.05", "12.05", "14.05", "16.05", "18.05", "20.05"],["10.10", "12.10", "14.10", "16.10", "18.10", "20.10"],["10.15", "12.15", "14.15", "16.15", "18.15","20.15"],["10.20", "12.20", "14.20", "16.20", "18.20","20.20"]]),
    Location(namaRute: "Intermoda-De Park (Rute 1) Bus", currentPoint: "Terminal Intermoda", destinationPoint: "The Breeze", rute: ["Terminal Intermoda", "Sinar Mas Plaza", "The Breeze"], time: [["10.00", "12.00", "14.00"],["10.10", "12.10", "14.10"],["10.15", "12.15", "14.15"]]),
    Location(namaRute: "Intermoda-De Park (Rute 1) Bus", currentPoint: "Sinar Mas Land", destinationPoint: "Terminal Intermoda", rute: ["Sinar Mas Land", "The Breeze", "CBD Timur", "SKY House AEON Mall", "CBD Barat", "Simplicity 1", "Terminal Intermoda"], time: [["10.00", "12.00", "14.00", "16.00", "18.00", "20.00", "22.00"],["10.05", "12.05", "14.05", "16.05", "18.05", "20.05", "22.05"],["10.10", "12.10", "14.10", "16.10", "18.10", "20.10", "22.10"],["10.15", "12.15", "14.15", "16.15", "18.15", "20.15", "22.15"],["10.20", "12.20", "14.20", "16.20", "18.20", "20.20", "22.20"],["10.25", "12.25", "14.25", "16.25", "18.25", "20.25", "22.25"],["10.30", "12.30", "14.30", "16.30", "18.30", "20.30", "22.30"]]),
    Location(namaRute: "Intermoda-De Park (Rute 1) Bus", currentPoint: "The Breeze", destinationPoint: "Terminal Intermoda", rute: ["The Breeze", "CBD Timur", "SKY House AEON Mall", "CBD Barat", "Simplicity 1", "Terminal Intermoda"], time: [["10.00", "12.00", "14.00", "16.00", "18.00", "20.00"],["10.05", "12.05", "14.05", "16.05", "18.05", "20.05"],["10.10", "12.10", "14.10", "16.10", "18.10", "20.10"],["10.15", "12.15", "14.15", "16.15", "18.15","20.15"],["10.20", "12.20", "14.20", "16.20", "18.20","20.20"]]),
    Location(namaRute: "Intermoda-De Park (Rute 1) Bus", currentPoint: "Terminal Intermoda", destinationPoint: "The Breeze", rute: ["Terminal Intermoda", "Sinar Mas Plaza", "The Breeze"], time: [["10.00", "12.00", "14.00"],["10.10", "12.10", "14.10"],["10.15", "12.15", "14.15"]]),
//    Location(name: "The Breeze", latitude: -6.301275723658521, longitude: 106.65313628889636,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "CBD Timur", latitude: -6.303551348834457, longitude: 106.65013956132293,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "SKY House AEON Mall", latitude: -6.302964031453744, longitude: 106.64490136099086,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "CBD Barat", latitude: -6.302233736783434, longitude: 106.6420778529722,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Simplicity 1", latitude: -6.31320074436008, longitude: 106.64316926692551,time: ["06.30", "10.30", "12.30", "14.00", "15.00"]),
//    Location(name: "Terminal Intermoda", latitude: -6.32084247949462, longitude: 106.64364252576979,time: ["06.30", "10.30", "12.30", "14.00", "15.00"])
]
