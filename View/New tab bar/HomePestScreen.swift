//
//  HomePestScreen.swift
//  Pestless
//
//  Created by Local Administrator on 17/11/22.
//

import SwiftUI

struct HomePestScreen: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20){
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.cardGreen2)
                    VStack(alignment: .leading){
                        Text("Tanamanmu diserang hama?")
                            .bold()
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.white)
                        Text("Tak perlu khawatir coba pindai")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                        
                        Spacer()
                        HStack{
                            Spacer()
                            NavigationLink {
                                CustomCameraView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Pindai")
                                    .background {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: 90, height: 35)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                            }
                        }
                        .padding()
                    }
                    .padding()
                    
                }
                .frame(width: 360, height: 400)
                
                Text("Hama")
                    .padding(.trailing, 250)
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.pestTitleGreen)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(PestList) { pest in
                            VStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16)
                                        .frame(width: 100, height: 150)
                                        .foregroundColor(.yellowbg)
                                    Image(pest.image)
                                }
                                Text(pest.name)
                                    .padding(.leading, 20)
                                    .font(.system(.caption, design: .rounded))
                                    .bold()
                                    .foregroundColor(.pestGreen)
                            }
                        }
                    }
                }
                    
                Spacer()
                
            }
            .padding(.leading, 25)
            .navigationTitle("Hama")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomePestScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomePestScreen()
    }
}
