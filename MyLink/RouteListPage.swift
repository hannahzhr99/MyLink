//
//  RouteListPage.swift
//  MyLink
//
//  Created by Hannah's Mac on 21/05/23.
//

import SwiftUI

struct RouteListPage: View {
//    @Environment(\.presentationMode) var presentationMode
    @Binding var popToRoot : Bool
    var data: Location
    var jam: [String]
    
    var body: some View {
        VStack (alignment: .center, spacing: 6) {
            HStack {
                VStack (alignment: .leading, spacing: 2) {
                    Text("\(data.namaRute)")
                        .foregroundColor(data.namaRute == "Electric Bus" ? Color("Blue") : Color("Green"))
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                    Text("Your routes")
                        .foregroundColor(Color(.black))
                        .fontWeight(.semibold)
                        .font(.system(size: 26))
                }
                .padding(.trailing, 130)
                .padding(.top,10)
                .padding(.leading)
                .padding(.bottom)
                Spacer()
            }
           
            
            VStack {
//                ForEach(data.rute, id: \.self) { loc in
//                    RouteListTemplate(route: loc, jam: jam[0])
//                }
//                ForEach(Array(locations.enumerated()), id: \.element.id) { index, loc in
//                    if index < locations.count-1 {
//                        RouteListTemplate(route: loc.rute[0], jam: loc.time[0][index])
//                    }
//                    else {
//                        RouteListLast(route: loc.rute[0], jam: loc.time[0][0])
//                    }

//                }
                ForEach(Array(data.rute.enumerated()), id: \.element.self) { index, loc in
                    if index < locations.count-1 {
                        RouteListTemplate(route: loc, jam: jam[index])
                    }
                    else {
                        RouteListLast(route: loc, jam: jam[index])
                    }
                    
                }
            }
            .padding()
            Spacer()
            
            Button {
//                presentationMode.wrappedValue.dismiss()
                self.popToRoot = false
                
            } label: {
                Text("Start Over")
                    .padding()
                    .frame(minWidth: 361)
                    .foregroundColor(Color(.white))
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .background(Color("PO-500"))
                    .cornerRadius(6)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

//struct RouteListPage_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteListPage(data: Location())
//    }
//}
