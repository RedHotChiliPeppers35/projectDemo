//
//  AppController.swift
//  projectDemo
//
//  Created by Ata Berk Cinetci on 20.10.2024.
//

import Foundation
import SwiftUI
import FirebaseAuth


enum AuthState{
    case undefined, authenticated, notAuthenticated
}

@Observable
class AppController {
    
    var userEmail: String = ""
    var userPassword : String = ""
    
    
    var confirmPassword: String = ""
    var userAge: String = ""
    
    var authState: AuthState = .undefined
    var errorMessage: String?
    var isLoading: Bool = false
    
    
  
    func signUp() async throws {
        
        _ = try await Auth.auth().createUser(withEmail: userEmail, password: userPassword)
        
        
    }
    
    
    func signIn() async throws {
        
        _ = try await Auth.auth().signIn(withEmail: userEmail, password: userPassword)
    }
    
    
    func signOut() throws {
        
        _ = try Auth.auth().signOut()
    }
    
    
    
    
    
    
}
