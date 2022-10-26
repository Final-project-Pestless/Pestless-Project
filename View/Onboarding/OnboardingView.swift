//
//  OnboardingView.swift
//  Pestless
//
//  Created by Local Administrator on 26/10/22.
//

import SwiftUI
struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let image: String
    let text: String
    
    static let dataList: [OnboardingData] = [
        OnboardingData(id: 0, image: "onboarding1", text: "Pestless is a revolutionary app that will tell you exactly what pests are plaguing your plants, and help you to get rid of them."),
        OnboardingData(id: 1, image: "onboarding2", text: "It scans your plants in a few seconds and tells you exactly what pests are on them, giving tips step by step to control pests."),
        OnboardingData(id: 2, image: "onboarding3", text: "Save your time, money, and help you grow healthy food")
        
    ]
}
struct OnboardingView: View {
    @State var onboardingState: Int = 0
    @State var username: String = ""
    @State private var isAnimating: Bool = false
    @AppStorage("name") var currentUserName: String?
    @AppStorage("signed_in") var signedIn: Bool = false
    var data: OnboardingData
    var body: some View {
        VStack(spacing: 70) {
            ZStack{
                Circle()
                    .frame(width: 373, height: 299)
                    .foregroundColor(Color.green)
                Image(data.image)
            }
            Text(data.text)
                .padding()
            HStack{
                Button {
                    
                } label: {
                    Text("Prev")
                }
                .padding(.horizontal)
                Spacer()
                Button {
                    
                } label: {
                    Text("Next")
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        }
    }
        
}
//
//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
