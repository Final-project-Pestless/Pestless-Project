//
//  PestResultView.swift
//  Pestless
//
//  Created by Local Administrator on 16/11/22.
//

import SwiftUI


struct PestResultView: View {
    @Binding var predictionLabel: String
    @Binding var percentage: String
    var body: some View {
        NavigationView {
            VStack {
                Image("kutu")
                    .resizable()
                    .frame(width: 325, height: 300)
                    .padding()
                Text("\(predictionLabel)")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.pestTitleGreen)
                    .padding(.vertical, 2)
               
                Text("Tingkat akurasi: \(percentage)%")
                    .font(.system(.callout, design: .rounded))
                    .foregroundColor(.pestTitleGreen)
                    .padding(.bottom)
                Spacer()
                NavigationLink {
                    PestResultDetailView()
                } label: {
                    Text("Lihat cara kontrol")
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 45)
                            
                        }
                }
                .padding(.bottom, 25)
                NavigationLink {
                    CustomCameraView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Kurang yakin? hasil tdk cocok")
                        .foregroundColor(.pestTitleGreen)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 45)
                                .foregroundColor(.white)
                                .shadow(color: .pestTitleGreen ,radius: 3)
                                
                            
                        }
                }
                Spacer()
            }
            .navigationTitle("Hasil")
            .navigationBarTitleDisplayMode(.inline)
        }
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
