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
        OnboardingData(id: 0, image: "boarding1", text: "Pestless akan memindai hama apa saja yang mengganggu tanaman mu."),
        OnboardingData(id: 1, image: "boarding2", text: "Dapatkan cara mengendalikan hama tersebut agar tanamanmu selalu sehat dan aman untuk konsumsi.")
    ]
}
struct OnboardingView: View {
    @Binding var onboardingState: Int
    @State private var isAnimating: Bool = false
    
    var data: OnboardingData
    var body: some View {
        
        VStack{
            NavigationLink {
                TabBarView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Lewati")
                    .foregroundColor(Color("AccentColor"))
                    .bold()
            }
            .padding(.leading, 300)
            
            
            ZStack{
                
                Image("awan")
                    .resizable()
                
                    .frame(width: 390, height: 286)
                    .foregroundColor(Color("green2"))
                
                Image(data.image)
            }
            .padding(.bottom, 100)
            .padding(.top, 30)
            Text(data.text)
                .padding()
                .frame(width: 400)
                .multilineTextAlignment(.center)
            
            if onboardingState == 1 {
                NavigationLink {
                    TabBarView()
                        .navigationBarBackButtonHidden()
                } label: {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("AccentColor"))
                            .frame(width: 350, height: 45)
                        Text("Mulai")
                            .foregroundColor(.white)
                            .bold()
                        
                        
                    }
                }
                .padding(.top, 100)
                
            }
            Spacer()
        }
        
        .onAppear {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        }
        
        
    }
    
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViews()
    }
}
