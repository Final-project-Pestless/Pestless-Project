//
//  CegahView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 02/12/22.
//

import SwiftUI

struct CegahView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("cegahbg")
                    .padding(.leading, -50)
                
                VStack {
                    Text("Kamu belum memasukkan tanaman yang ingin dilindungi. Masukkan sekarang?")
                        .frame(width: 288)
                        .padding(.top, -50)
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .font(.system(.body, design: .rounded))
                    
                    NavigationLink {
                        PilihTanaman()
    //                                            .toolbar(.hidden, for: .tabBar)
                            .navigationBarBackButtonHidden()
    //                                            .ignoresSafeArea()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 45)
                                .foregroundColor(.pestGreen)
    //                            .bold()
                            
                            HStack{
                                Text("Tambah Tanaman")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                
                            }
                        }
                    }
                    
                }.navigationTitle("Cegah")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PilihTanaman: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("cegahbg")
                    .padding(.leading, -50)
                
                VStack {
                    Text("Yuk, mulai cegah hama dengan memilih tanaman yang mau dilindungi")
                        .frame(width: 288)
                        .padding(.top, -50)
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .font(.system(.body, design: .rounded))
                    
                    HStack {
                        Text("Tanamanmu")
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                            .font(.system(.body, design: .rounded))
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.pestGreen)
                                .font(.system(size: 34))
                            
                                .font(.system(.body, design: .rounded))
                        }

                    }
                    
                }.navigationTitle("Cegah")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct CegahView_Previews: PreviewProvider {
    static var previews: some View {
        CegahView()
    }
}
