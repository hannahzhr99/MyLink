//
//  LandingPage.swift
//  MyLink
//
//  Created by Hannah's Mac on 19/05/23.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("PO-500"))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 200)
                Spacer()
                    .frame(height: 50)
                Button(action: {
                            // Button action code here
                            print("Button tapped")
                        }) {
                            Text("Get Started")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .foregroundColor(Color("PO-500"))
                                .padding()
                                .frame(height: 44)
                                .background(Color.white)
                                .cornerRadius(6)
                        }
                        .frame(width: 200, height: 50)
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
