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
                .toolbar(.hidden, for: .tabBar)
                .tabItem({
                    Label("Home", systemImage: "house.fill")
                })
                .tag(0)
            
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
