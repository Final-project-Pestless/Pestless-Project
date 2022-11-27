//
//  PestlessApp.swift
//  Pestless
//
//  Created by Local Administrator on 20/10/22.
//

import SwiftUI

@main
struct PestlessApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("FirstTimeUser") var firstTimeUser: Bool = true
//    @UserDefaults var firstTimeUser = true
    var body: some Scene {
        WindowGroup {
            if firstTimeUser {
                OnboardingViews()
            } else {
                TabBarView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
