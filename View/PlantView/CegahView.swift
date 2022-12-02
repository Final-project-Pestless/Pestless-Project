//  CegahView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 02/12/22.
//

import SwiftUI

struct CegahView: View {
    init() {
           UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
       }
    @ObservedObject var plantViewModel = SavedPlantsViewModel.shared
    var body: some View {
        NavigationView {
            
            ZStack {
                Image("cegahbg")
                    .padding(.trailing, 195)
                    .padding(.bottom, 510)
                
                VStack {
                    Text("Kamu belum memasukkan tanaman yang ingin dilindungi. Masukkan sekarang?")
                        .frame(width: 288)
                        .padding(.top, -50)
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .font(.system(.body, design: .rounded))
                    
                    NavigationLink {
                        ChoosePlantView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 45)
                                .foregroundColor(.pestGreen)
                            
                            HStack{
                                Text("Tambah Tanaman")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                
                            }
                        }
                    }
                    .padding(.bottom, 400)
                    
                }
                .navigationTitle("Cegah")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear{
                plantViewModel.fetch()
            }
        }
    }
}


struct CegahView_Previews: PreviewProvider {
    static var previews: some View {
        CegahView()
    }
}
