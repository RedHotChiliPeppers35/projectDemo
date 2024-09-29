//
//  ContentView.swift
//  projectDemo
//
//  Created by Ata Berk Cinetci on 29.09.2024.
//

import SwiftUI

// colorHunt link https://colorhunt.co/palette/222831393e4600adb5eeeeee


struct WelcomePage: View {
    var body: some View {
        
        NavigationView {
            GeometryReader {  geometry in
                ZStack {
                    Color(hex: 0x222831).ignoresSafeArea()
                    VStack {
                        Spacer()
                        Text("Welcome to my Auth App!")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: 0xEEEEEE))
                            .font(.system(size: 40))
                        
                        Spacer()
                        NavigationLink(destination: CheckState()){
                            Text("Click here for Authentication").foregroundColor(Color(hex: 0xEEEEEE))
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                                .background(Color(hex: 0x00ADB5))
                                .cornerRadius(20)
                            
                        }
                        Spacer()
                        
                    }
                    
                    .padding()
                }
            }
            
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    WelcomePage()
}


extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
