//
//  PestResultView.swift
//  Pestless
//
//  Created by Local Administrator on 16/11/22.
//

import SwiftUI


struct PestResultView: View {
    @Binding var percentage: String
    @Binding var detectedPest : PestData?
    @Binding var percentageDouble: Double
    var body: some View {
    //    NavigationView {
            ScrollView {
                VStack {
                    
                    Image(detectedPest?.image[0] ?? "kutu")
                    
                    //harus diganti pake database
                        .resizable()
                        .frame(width: 350, height: 250)
                        .padding()
                    Text(detectedPest?.name ?? "No data")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.pestTitleGreen)
                        .padding(.vertical, 2)
               
                   
                    Text("Tingkat akurasi: \(percentage)%")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.pestTitleGreen)
                        .padding(.bottom)
                    Spacer()
                    VStack(alignment: .leading){
                        
                        Text("Ciri-ciri")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.pestTitleGreen)
                            .bold()
                        Text(detectedPest?.identity ?? "no deskripsi")
                            .foregroundColor(.grayText)
                            .font(.system(.subheadline, design: .rounded))
                            .padding(.bottom)
                        Text("Tanaman yang diserang")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.pestTitleGreen)
                            .bold()
                        Text(detectedPest?.plant ?? "tanaman yang diserang")
                            .foregroundColor(.grayText)
                            .font(.system(.subheadline, design: .rounded))
                        
                    }
                    .padding()
                    
                    NavigationLink {
                        PestResultDetailView(detectedPest: detectedPest)
                    } label: {
                        ZStack {
                           
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 45)
                            Text("Lihat cara kontrol")
                                .foregroundColor(.white)
                        }
                             
                    }
                    .padding(.bottom, 25)
                    NavigationLink {
                        TabBarView()
                            .navigationBarBackButtonHidden()
                            .toolbar(.hidden, for: .tabBar)
//                        CustomCameraView()
//                            .navigationBarBackButtonHidden()
//                            .animation(.linear)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 45)
                                .foregroundColor(.white)
                                .shadow(color: .pestTitleGreen ,radius: 3)
                            Text("Tidak yakin?")
                                .foregroundColor(.pestTitleGreen)
                        }
                    }
                    
                }
               
            }
            .toolbar(.visible, for: .tabBar)
            .navigationTitle("Hasil")
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarHidden(true)

       // }
    }
}
//
//struct PestResultView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        PestResultView( )
//    }
//}
