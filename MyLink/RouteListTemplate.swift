//
//  RouteListTemplate.swift
//  MyLink
//
//  Created by Dwianditya Hanif Raharjanto on 25/05/23.
//

import SwiftUI

struct RouteListTemplate: View {
    var route: String
    var jam: String
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            HStack {
                HStack (spacing: 12){
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("PO-500"))
                        .font(.system(size: 18))
                    Text("\(route)")
                        .fontWeight(.semibold)
                        .font(.system(size: 17))
                        .foregroundColor(Color(.black))
                }
                Spacer()
                HStack {
                    Text("\(jam)")
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
    }
}

struct RouteListTemplate_Previews: PreviewProvider {
    static var previews: some View {
        RouteListTemplate(route: "Thebreeze", jam: "21.99")
    }
}
