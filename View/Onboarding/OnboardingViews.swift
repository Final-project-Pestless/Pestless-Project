//
//  OnboardingViews.swift
//  Pestless
//
//  Created by Local Administrator on 26/10/22.
//

import SwiftUI

struct OnboardingViews: View {
    @State private var currentTab = 0
    var body: some View {
        NavigationView {
            
            
            TabView(selection: $currentTab){
                ForEach(OnboardingData.dataList) { data in
                    OnboardingView(onboardingState: $currentTab, data: data)
                        .tag(data.id)
                    
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        
    }
}

struct OnboardingViews_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViews()
    }
}
