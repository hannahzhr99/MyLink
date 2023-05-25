//
//  RouteListPage.swift
//  MyLink
//
//  Created by Hannah's Mac on 21/05/23.
//

import SwiftUI

struct RouteListPage: View {
    var body: some View {
        VStack (alignment: .center, spacing: 6) {
            VStack (alignment: .leading, spacing: 2) {
                Text("Intermoda-De Park (Rute 1) Bus")
                    .foregroundColor(Color("Green"))
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                Text("Your routes")
                    .foregroundColor(Color(.black))
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
            }
            .padding(.trailing, 130)
            
            VStack (alignment: .leading, spacing: 20) {
                HStack {
                    HStack (spacing: 12){
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color("PO-500"))
                            .font(.system(size: 18))
                        Text("The Breeze")
                            .fontWeight(.semibold)
                            .font(.system(size: 17))
                            .foregroundColor(Color(.black))
                    }
                    Spacer()
                    HStack {
                        Text("12.05")
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .foregroundColor(Color("Black"))
                    }
                }
                
                                HStack {
                                    VStack (spacing: 2.7) {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(Color("PO-500"))
                                            .font(.system(size: 4))
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(Color("PO-500"))
                                            .font(.system(size: 4))
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(Color("PO-500"))
                                            .font(.system(size: 4))
                                    }
                                }
                                .padding(.init(top: -20, leading: 8, bottom: 0, trailing: 0))
            }
            .padding()
            Spacer()
            
            NavigationLink {
                //                SuggestedPage(Destination: $Destination)
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
        }
    }
}

struct RouteListPage_Previews: PreviewProvider {
    static var previews: some View {
        RouteListPage()
    }
}
