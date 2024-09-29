//
//  File.swift
//  projectDemo
//
//  Created by Ata Berk Cinetci on 6.10.2024.
//

import Foundation
import SwiftUI

struct LogInPage: View {
    
    
    @Environment(AppController.self) private var appController
    
    
    @Binding var isLog: Bool
    var body: some View {
        
        
        NavigationView {
            GeometryReader {
                geometry in
                ZStack {
                    Color(hex: 0x222831).ignoresSafeArea()
                    VStack(spacing: 20){
                        TextField("", text: Bindable(appController).userEmail, prompt: Text("E-Mail").foregroundColor(Color.black))
                            .padding()
                            .background(Color.white)
                            .textFieldStyle(PlainTextFieldStyle())// Background color inside the
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.8), lineWidth: 2) // Dark gray frame
                            ).padding(.horizontal)
                        SecureField("", text: Bindable(appController).userPassword, prompt: Text("Password").foregroundColor(Color.black)) .padding()
                            .background(Color.white) // Background color inside the frame
                            .cornerRadius(8)
                            .accentColor(Color.red)
                            .textFieldStyle(PlainTextFieldStyle())//
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.8), lineWidth: 2)
                            ).padding(.horizontal)
                        Button(action: {
                            
                            signIn()
                            
                        }) {
                            ZStack {
                                Text("Sign In")
                                    .font(.system(size: 25))
                                    .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.15)
                                    .multilineTextAlignment(.center)
                                    .background(Color(hex:0x00ADB5))
                                    .foregroundStyle(Color(hex: 0xEEEEEE))
                                    .cornerRadius(10)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .padding()
                            }
                        }
                        Text("Don't you have an account?")
                            .foregroundStyle(Color(hex: 0xEEEEEE))
                            .font(.system(size: 18))
                        
                        Button("Sign Up!")
                        {
                            isLog = false
                        } .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundStyle(Color(hex: 0xEEEEEE))
                            .underline()
                    }
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }.navigationBarBackButtonHidden(true)
        
        
       
    }
    
    func signIn() {
        Task {
            do {
                try await appController.signIn()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    
}
