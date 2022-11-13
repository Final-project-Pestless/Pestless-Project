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

    var body: some Scene {
        WindowGroup {
           ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
