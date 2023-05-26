//
//  SuggestedRouteTemplate.swift
//  MyLink
//
//  Created by Dwianditya Hanif Raharjanto on 25/05/23.
//

import SwiftUI

struct SuggestedRouteTemplate: View {
//    var destination: String
    var namaRute: String
    var originRute: String
    var jam: String
    var body: some View {
        HStack (alignment: .center, spacing: 32) {
            VStack (alignment: .leading, spacing: 6){
                HStack {
                    Text(namaRute)
                        .fontWeight(.semibold)
                        .font(.system(size: 17))
                        .foregroundColor(namaRute == "Electric Bus" ? Color("Blue") : Color("Green"))
                    Spacer()
                }
                Text(originRute)
                    .fontWeight(.medium)
                    .font(.system(size: 15))
                    .foregroundColor(Color("Systemgray2-Light"))
            }
//            Spacer()
            VStack{
                Text(jam)
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .foregroundColor(Color("Black"))
            }
        }
        .padding()
        .frame(minWidth: 361)
        .background(Color(.white))
        .cornerRadius(6)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)    }
}

struct SuggestedRouteTemplate_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedRouteTemplate(namaRute: "The breeze", originRute: "Intermoda-depark", jam: "Intermoda")
    }
}
