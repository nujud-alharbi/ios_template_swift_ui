//
//  AppDelegate.swift
//  ios_template_swift_ui
//
//  Created by Nujud Alalawi on 18/11/1444 AH.
//


import SwiftUI
import FirebaseCore
import FirebaseAuth



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()


    return true
  }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
           print("\(#function)")
           if Auth.auth().canHandleNotification(notification) {
               completionHandler(.noData)
               return
           }
       }
}


