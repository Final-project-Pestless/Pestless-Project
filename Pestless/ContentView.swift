//
//  ContentView.swift
//  Pestless
//
//  Created by Local Administrator on 20/10/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    var body: some View {
        NavigationView {
            Text("hello")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//tes rizky
