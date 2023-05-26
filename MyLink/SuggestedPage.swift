//
//  SuggestedPage.swift
//  MyLink
//
//  Created by Hannah's Mac on 19/05/23.
//

import SwiftUI

struct SuggestedPage: View {
    var destination: String
    var placeholder1: String
    var placeholder2: String
    var placeholder3: String
    @Binding var rootIsActive : Bool
    var data: Location
//    @Binding var path: [Int]
    
    var body: some View {
        //        ForEach((1...2), id: \.self){
        VStack (alignment: .center, spacing: 14){
            HStack {
                VStack (spacing: 2.7){
                    Image(systemName: "location.circle.fill")
                        .foregroundColor(Color("Blue"))
                        .font(.system(size: 17))
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color(UIColor.systemGray2))
                        .font(.system(size: 3))
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color(UIColor.systemGray2))
                        .font(.system(size: 3))
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color(UIColor.systemGray2))
                        .font(.system(size: 3))
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(Color("PO-500"))
                        .font(.system(size: 17))
                }
                .padding()
                
                VStack (alignment: .leading) {
                    Text("The Breeze")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    Divider()
                    Text(destination)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                }
            }
            .background(Color(UIColor.systemGray6))
            .cornerRadius(6)
            .padding()
            
            VStack (alignment: .leading) {
                Text("Suggested Bus Routes")
                    .foregroundColor(Color(UIColor.systemGray2))
                    .fontWeight(.medium)
                    .font(.system(size: 15))
                
                VStack (spacing: 20) {
                    VStack {
                        ForEach(data.time, id: \.self) { loc in
                            NavigationLink(destination: RouteListPage(popToRoot: self.$rootIsActive, data: data, jam: loc)){
                                SuggestedRouteTemplate(namaRute: data.namaRute, originRute: data.currentPoint, jam: loc[0])
                            }
                            
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        //        }
    }
}
//
//#if DEBUG
//struct SuggestedPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SuggestedPage(destination: "Terminal Intermoda", placeholder1: "test", placeholder2: "test", placeholder3: "test")
//    }
//}
//#endif
