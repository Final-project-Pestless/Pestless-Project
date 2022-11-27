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
            ScrollView {
                VStack(alignment: .center, spacing: 20){
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(LinearGradient(
                                gradient: .init(colors: [Color.homeGreen, Color.homeYellow]),
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                            .frame(width: 350, height: 400)
                        VStack(alignment: .leading){
                            Text("Hama apa yang sedang menyerang tanamanmu?")
                                .bold()
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(.white)
                            Text("Yuk cari tahu!")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(.title, design: .rounded))
                            
                            Spacer()
                            HStack{
                                Spacer()
                                VStack{
                                    NavigationLink {
                                        PestSearchView()
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 180, height: 45)
                                                .foregroundColor(.white)
                                                .bold()
                                            HStack{
                                                Image(systemName: "magnifyingglass")
                                                Text("Cari hama")
                                            }
                                        }
                                        
                                    }
                                    
                                    NavigationLink {
                                        CustomCameraView()
                                            .toolbar(.hidden, for: .tabBar)
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 180, height: 45)
                                                .foregroundColor(.white)
                                                .bold()
                                            
                                            HStack{
                                                Image(systemName: "camera.metering.spot")
                                                Text("Pindai")
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                        .padding()
                        
                    }
                    .frame( width: 350, height: 400)
                    
                    Text("Hama yang ditemukan")
                        .padding(.trailing, 100)
                        .font(.system(.title2, design: .rounded, weight: .semibold))
                        .foregroundColor(.pestTitleGreen)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(PestList) { pest in
                                
                                NavigationLink {
                                    PestResultDetailView(detectedPest: pest)
                                } label: {
                                
                                    VStack{
                               //         ZStack{
                                 //           RoundedRectangle(cornerRadius: 16)
                                 //               .frame(width: 100, height: 150)
                                     //           .foregroundColor(.yellowbg)
                                            Image(pest.image[0])
                                            .resizable()
                                            .frame(width: 120, height: 140)
                                            
                                    //    }
                                        Text(pest.name)
                                            .font(.system(.caption, design: .rounded))
                                            .bold()
                                            .foregroundColor(.pestGreen)
                                    }
                                    
                                }
                            }
                        }.padding(.leading,20)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                }
                .navigationTitle("Hama")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct HomePestScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomePestScreen()
    }
}
