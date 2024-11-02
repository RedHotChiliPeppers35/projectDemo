//
//  SignUpPage.swift
//  projectDemo
//
//  Created by Ata Berk Cinetci on 29.09.2024.
//
import Foundation
import SwiftUI

struct SignUpPage: View {
    
    @Environment(AppController.self) private var appController
    
    
    @Binding var isLog: Bool
    
    var body: some View {
        GeometryReader{
            geometry in
            ZStack{
                Color(hex: 0x222831).ignoresSafeArea()
                
                VStack{
                  
                    TextField("", text: Bindable(appController).userEmail, prompt: Text("E-Mail").foregroundColor(Color.black))
                        .padding()
                    
                        .background(Color.white)
                        .textFieldStyle(PlainTextFieldStyle())// Background color inside the
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.8), lineWidth: 2) // Dark gray frame
                        ).padding(.horizontal).padding(.vertical)
               
         
                    TextField("", text: Bindable(appController).userAge, prompt: Text("User Age").foregroundColor(Color.black))
                        .padding()
                        .keyboardType(.numberPad)
                        .background(Color.white)
                        .textFieldStyle(PlainTextFieldStyle())// Background color inside the
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.8), lineWidth: 2) // Dark gray frame
                        ).padding(.horizontal).padding(.vertical)
                    
                    SecureField("", text: Bindable(appController).userPassword, prompt: Text("Password").foregroundColor(Color.black))
                        .padding()
                        .background(Color.white)
                        .textFieldStyle(PlainTextFieldStyle())// Background color inside the
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.8), lineWidth: 2) // Dark gray frame
                        ).padding(.horizontal).padding(.vertical)
                    
                    
                    SecureField("", text: Bindable(appController).confirmPassword, prompt: Text("Confirm Password").foregroundColor(Color.black))
                        .padding()
                        .background(Color.white)
                        .textFieldStyle(PlainTextFieldStyle())// Background color inside the
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.8), lineWidth: 2) // Dark gray frame
                        ).padding(.horizontal).padding(.vertical)
                  
                  
                    Button(action: {
                        signUp()
                        
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
                .padding()
                .buttonStyle(PlainButtonStyle())
                    Text("Already have an account?")
                        .foregroundStyle(Color(hex: 0xEEEEEE))
                        .font(.system(size: 18))
                    
                    Button("Log In!")
                    {
                        isLog = true
                    } .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundStyle(Color(hex: 0xEEEEEE))
                        .underline()
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
               
                }
                
        }.navigationBarBackButtonHidden()
    }
    
    
    func signUp() {
        Task {
            do {
                try await appController.signUp()
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
}

