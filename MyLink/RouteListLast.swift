//
//  RouteListLast.swift
//  MyLink
//
//  Created by Dwianditya Hanif Raharjanto on 25/05/23.
//

import SwiftUI

struct RouteListLast: View {
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
        }
    }
}

struct RouteListLast_Previews: PreviewProvider {
    static var previews: some View {
        RouteListLast(route: "wkw", jam: "20.00")
    }
}
