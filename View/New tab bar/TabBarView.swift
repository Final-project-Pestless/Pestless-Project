//
//  TabBarView.swift
//  Pestless
//
//  Created by Local Administrator on 19/11/22.
//

import SwiftUI

struct TabBarView: View {
    @State var selected: Int = 0
    var body: some View {
        TabView(selection: $selected) {
            HomePestScreen()
//                .toolbar(.hidden, for: .tabBar)
                .tabItem({
                    Label("Kenali", image: "tabicon1")
                })
                .tag(0)
            SnappedHistory()
                .tabItem({
                    Label("Riwayat", systemImage: "clock.arrow.circlepath")
                })
                .tag(1)
            TrackerView()
                .tabItem {
                    Label("Obati", systemImage: "house")
                }
                .tag(2)
            
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
