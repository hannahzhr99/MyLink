//
//  MapPage.swift
//  MyLink
//
//  Created by Hannah's Mac on 19/05/23.
//

import SwiftUI

struct MapPage: View {
    @State var destination: String = ""
    var body: some View {
        NavigationView() {
            VStack {
                Spacer()
                HStack{
                    List {
                        ForEach(searchResults, id: \.self) { name in
                            NavigationLink {
                                SuggestedPage(destination: name.destinationPoint, placeholder1: name.namaRute, placeholder2: name.currentPoint , placeholder3: name.time[0][0])
                                
                            } label: {
                                Text(name.destinationPoint)
                            }
                        }
                    }
                    .navigationTitle("Bus")
//                    TextField(text: $destination, prompt: Text("Where do you want to go?")){}
//                        .padding()
//                        .foregroundColor(Color(UIColor.systemGray))
//                        .font(.system(size: 17))
//                        .fontWeight(.medium)
//                        .background(.white)
//                        .cornerRadius(6)
//                    NavigationLink {
//                        SuggestedPage(Destination: $d3estination)
//                    } label: {
//                        Image(systemName: "magnifyingglass")
//                            .padding()
//                            .foregroundColor(Color(.white))
//                            .font(.system(size: 17))
//                            .background(Color("PO-500"))
//                            .cornerRadius(6)
//                    }
                }
                .searchable(text: $destination, prompt: "Cari Destinasi")
//                .padding()
            }
        }.onAppear(){
            print("hello world")
        }
    }
        
    var searchResults: [Location] {
        if destination.isEmpty {
            return locations
        } else {
            return locations.filter { $0.destinationPoint.contains(destination) }
        }
    }
}

struct MapPage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage()
    }
}
