//
//  AppDelegate.swift
//  ios_template_swift_ui
//
//  Created by Nujud Alalawi on 18/11/1444 AH.
//


import SwiftUI
import FirebaseCore



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()


    return true
  }
}


