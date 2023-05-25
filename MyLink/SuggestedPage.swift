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
                    HStack (alignment: .center, spacing: 32) {
                        VStack (alignment: .leading, spacing: 6){
                            Text(placeholder1)
                                .fontWeight(.semibold)
                                .font(.system(size: 17))
                                .foregroundColor(Color("Green"))
                            Text(placeholder2)
                                .fontWeight(.medium)
                                .font(.system(size: 15))
                                .foregroundColor(Color("Systemgray2-Light"))
                        }
                        VStack{
                            Text(placeholder3)
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                                .foregroundColor(Color("Black"))
                        }
                    }
                    .padding()
                    .frame(minWidth: 361)
                    .background(Color(.white))
                    .cornerRadius(6)
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                    
                    HStack (alignment: .center, spacing: 32) {
                        VStack (alignment: .leading, spacing: 6){
                            Text("Intermoda-De Park (Rute 1) Bus")
                                .fontWeight(.semibold)
                                .font(.system(size: 17))
                                .foregroundColor(Color("Green"))
                            Text("The Breeze")
                                .fontWeight(.medium)
                                .font(.system(size: 15))
                                .foregroundColor(Color("Systemgray2-Light"))
                        }
                        VStack{
                            Text("12.05")
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                                .foregroundColor(Color("Black"))
                        }
                    }
                    .padding()
                    .frame(minWidth: 361)
                    .background(Color(.white))
                    .cornerRadius(6)
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(false)
        //        }
    }
}

#if DEBUG
struct SuggestedPage_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedPage(destination: "Terminal Intermoda", placeholder1: "test", placeholder2: "test", placeholder3: "test")
    }
}
#endif
