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
                .tabItem({
                    Label("Kenali", image: "tabicon1")
                })
                .tag(0)
            ChoosePlantView()
                .tabItem {
                    Label("Cegah", image: "cegahIcon")
                }
                .tag(2)
            
            TrackerView()
                .tabItem {
                    Label("Pantau", image: "obati1")
                }
                .tag(3)
            
            SnappedHistory()
                .tabItem({
                    Label("Riwayat", systemImage: "clock.arrow.circlepath")
                })
                .tag(1)
           
            
        }
        .onAppear{
            UserDefaults.standard.set(false, forKey: "FirstTimeUser")
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
