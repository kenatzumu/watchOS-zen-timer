//
//  ZenTimerApp.swift
//  ZenTimer WatchKit Extension
//
//  Created by Horea Crisan on 07.06.2022.
//

import SwiftUI

@main
struct ZenTimerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
