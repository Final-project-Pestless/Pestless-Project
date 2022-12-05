//
//  PestlessApp.swift
//  Pestless
//
//  Created by Local Administrator on 20/10/22.
//

import SwiftUI

@main
struct PestlessApp: App {
    @Environment(\.managedObjectContext) var managedObjectContext
    let persistenceController = PersistenceController.shared
    @AppStorage("FirstTimeUser") var firstTimeUser: Bool = true
    var body: some Scene {
        WindowGroup {
            if firstTimeUser {
                OnboardingViews()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                TabBarView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }

    }
}

#if DEBUG
let dataStore = {
  if (ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1") {
    return PersistenceController.preview
  } else {
    return PersistenceController.shared
  }
}()
#else
let dataStore = PersistenceController.shared
#endif
//This little code block seems to let
