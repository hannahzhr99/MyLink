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
    Location(namaRute: "Intermoda De Park (Rute 1) Bus",
                 currentPoint: "Sinar Mas Land",
                 destinationPoint: "Terminal Intermoda",
                 rute: ["Sinar Mas Land", "The Breeze", "CBD Timur", "AEON Mall", "CBD Barat", "Simplicity 1", "Terminal Intermoda"],
                 time: [["10.00", "10.10", "11.00", "12.00", "12.30", "13.45", "14.00"],["11.00", "11.10", "12.00", "13.00", "13.30", "14.45", "15.00"]]),
        Location(namaRute: "Intermoda De Park (Rute 1) Bus",
                 currentPoint: "The Breeze",
                 destinationPoint: "Terminal Intermoda",
                 rute: ["The Breeze", "CBD Timur", "AEON Mall", "CBD Barat", "Simplicity 1", "Terminal Intermoda"],
                 time: [["10.10", "11.00", "12.00", "12.30", "13.45", "14.00"],["11.10", "12.00", "13.00", "13.30", "14.45", "15.00"]]),
        Location(namaRute: "Intermoda De Park (Rute 1) Bus",
                 currentPoint: "The Breeze",
                 destinationPoint: "CBD Barat",
                 rute: ["The Breeze", "CBD Timur", "AEON Mall", "CBD Barat"],
                 time: [["10.10", "11.00", "12.00", "12.30"],["11.10", "12.00", "13.00", "13.30"]]),
        Location(namaRute: "Electric Bus",
                 currentPoint: "Sinar Mas Land",
                 destinationPoint: "Terminal Intermoda",
                 rute: ["Sinar Mas Land", "The Breeze", "Digital Hub", "Verdant View", "Eternity", "Terminal Intermoda"],
                 time: [["11.00", "11.10", "12.00", "13.00", "13.30", "14.45"],["12.00", "12.10", "13.00", "14.00", "15.30", "15.45"]]),
        Location(namaRute: "Electric Bus",
                 currentPoint: "The Breeze",
                 destinationPoint: "Terminal Intermoda",
                 rute: ["The Breeze", "Digital Hub", "Verdant View", "Eternity", "Terminal Intermoda"],
                 time: [["11.10", "12.00", "13.00", "13.30", "14.45"],["12.10", "13.00", "14.00", "15.30", "15.45"]]),
        Location(namaRute: "Electric Bus",
                 currentPoint: "The Breeze",
                 destinationPoint: "Eternity",
                 rute: ["The Breeze", "Digital Hub", "Verdant View", "Eternity"],
                 time: [["11.10", "12.00", "13.00", "13.30"],["12.10", "13.00", "14.00", "15.30"]]),
]

/*
 Location(namaRute: "Electric Bus",
          currentPoint: "The Breeze",
          destinationPoint: "Terminal Intermoda",
          rute: ["The Breeze", "Digital Hub", "Verdant View", "Eternity", "Terminal Intermoda"],
          time: [["11.10", "12.00", "13.00", "13.30", "14.45"],["12.10", "13.00", "14.00", "15.30", "15.45"]])
 */
