//
//  projectDemoApp.swift
//  projectDemo
//
//  Created by Ata Berk Cinetci on 29.09.2024.
//
import Foundation
import SwiftUI


@main
struct projectDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var appController = AppController()
    
    
    var body: some Scene {
        WindowGroup {
            WelcomePage().environment(appController)
        }
    }
}


