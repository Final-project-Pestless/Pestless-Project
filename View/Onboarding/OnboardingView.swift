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
        OnboardingData(id: 0, image: "boarding1", text: "Pestless is a revolutionary app that will tell you exactly what pests are plaguing your plants, and help you to get rid of them."),
        OnboardingData(id: 1, image: "boarding2", text: "It scans your plants in a few seconds and tells you exactly what pests are on them, giving tips step by step to control pests."),
        OnboardingData(id: 2, image: "boarding3", text: "Save your time, money, and help you grow healthy food")
        
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
        ZStack {
            Color.yellowbg
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 392, height: 702)
                .padding(.bottom, 100)
                .foregroundColor(.white)
            VStack{
               
                Button(action: {
                    
                }, label: {
                    Text("Skip")
                        .foregroundColor(.black)
                        .bold()
                })
                    .padding(.leading, 300)
           
                
                ZStack{
                    
                    Image("cloud")
                        .resizable()
                    
                        .frame(width: 500, height: 400)
                        .foregroundColor(Color("green2"))
                    
                    Image(data.image)
                }
                Text(data.text)
                    .padding()
                    .frame(width: 400)
                    .multilineTextAlignment(.center)
                
            }
            .padding(.bottom, 200)
            
            .onAppear {
                isAnimating = false
                withAnimation(.easeOut(duration: 0.5)) {
                    self.isAnimating = true
                }
            }
        }
    }
    
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViews()
    }
}
