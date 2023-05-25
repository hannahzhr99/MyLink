//
//  LandingPage.swift
//  MyLink
//
//  Created by Hannah's Mac on 19/05/23.
//

import SwiftUI

struct LandingPage: View {
    @State var isActive: Bool = false
    
    var body: some View {
        if isActive {
            ShowMapView()
        }
        else {
            ZStack{
                Rectangle()
                    .foregroundColor(Color("PO-500"))
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("Icon Splash")
                     
                    Spacer()
                        .frame(height: 140)
                        
                    NavigationLink(destination: ShowMapView()) {
                        Text("Find Bus Routes")
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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
