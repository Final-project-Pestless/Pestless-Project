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
        
            VStack(alignment: .center, spacing: 10){
                ZStack {
                    Image("cegahbg")
                        .padding(.trailing, 193)
                        .padding(.bottom, 100)
                    //                    RoundedRectangle(cornerRadius: 25)
                    //                        .fill(LinearGradient(
                    //                            gradient: .init(colors: [Color.homeGreen, Color.homeYellow]),
                    //                            startPoint: .top,
                    //                            endPoint: .bottom))
                    //                        .frame(width: 350, height: 400)
                    VStack(alignment: .leading){
                        Spacer()
                        Text("Hama apa yang sedang menyerang tanamanmu?")
                            .bold()
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(Color.grayText)
                            .padding(.top, 100)
                        Text("Yuk cari tahu!")
                            .bold()
                            .foregroundColor(Color.grayText)
                            .font(.system(.title, design: .rounded))
                        
                        Spacer()
                        
                        VStack{
                            
                            
                            NavigationLink {
                                CustomCameraView()
                                //                                            .toolbar(.hidden, for: .tabBar)
                                    .navigationBarBackButtonHidden()
                                //                                            .ignoresSafeArea()
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 350, height: 45)
                                        .foregroundColor(Color.accentColor)
                                        .bold()
                                    
                                    HStack{
                                        Image(systemName: "camera.metering.spot")
                                            .foregroundColor(.white)
                                        Text("Pindai")
                                            .foregroundColor(.white)
                                        
                                    }
                                }
                            }
                            
                            
                            NavigationLink {
                                PestSearchView()
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 350, height: 45)
                                        .foregroundColor(Color.accentColor)
                                        .bold()
                                    HStack{
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.white)
                                        Text("Cari hama")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        
                    }
                    .padding()
                }
                .frame( width: 350, height: 400)
                
                Text("Hama yang ditemukan")
                    .padding(.trailing, 120)
                    .font(.system(.title2, design: .rounded, weight: .semibold))
                    .foregroundColor(.pestTitleGreen)
                
                
                List{
                    ForEach(pestList) { pest in
                        
                        NavigationLink {
                            PestResultDetailView(detectedPest: pest)
                        } label: {
                            HStack{
                                Image(pest.image[0])
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                VStack{
                                    Text(pest.name)
                                        .font(.system(size: 16, design: .rounded))
                                        .bold()
                                        .foregroundColor(.pestGreen)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Kenali")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct HomePestScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomePestScreen()
    }
}
