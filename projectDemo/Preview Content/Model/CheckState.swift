//
//  AuthPage.swift
//  projectDemo
//
//  Created by Ata Berk Cinetci on 29.09.2024.
//

import SwiftUI




struct CheckState: View {
    
    @State private var isLog: Bool = true
    
    var body: some View {
        Group {
            if isLog {
                LogInPage(isLog: $isLog)  // Show login page
            } else {
                SignUpPage(isLog: $isLog)
            }
        }
    }
}

#Preview {
    CheckState()
}
