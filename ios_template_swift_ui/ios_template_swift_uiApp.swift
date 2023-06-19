//
//  ios_template_swift_uiApp.swift
//  ios_template_swift_ui
//
//  Created by Nujud Alalawi on 18/11/1444 AH.
//

import SwiftUI


@main
struct ios_template_swift_uiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
          NavigationView {
                IntailScreen()
           }
        }
    }
}
