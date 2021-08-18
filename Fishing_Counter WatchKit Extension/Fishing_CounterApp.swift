//
//  Fishing_CounterApp.swift
//  Fishing_Counter WatchKit Extension
//
//  Created by Minhyun Cho on 2021/08/18.
//

import SwiftUI

@main
struct Fishing_CounterApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
