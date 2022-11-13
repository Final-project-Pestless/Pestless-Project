//
//  PestResultScreen.swift
//  Pestless
//
//  Created by Local Administrator on 11/11/22.
//

import SwiftUI

struct PestResultScreen: View {
    @State var pestName: String = "arphid"
    @State var selected: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
//                HStack {
//                    NavigationLink {
//                        ContentView()
//                    } label: {
//                        Image(systemName: "xmark")
//                            .font(.system(size: 24))
//                    }
//                    .padding()
//                    Spacer()
//
//                }
                Text("\(pestName)")
                    .foregroundColor(.accentColor)
                    .font(.system(.headline, design: .rounded))
                    .padding()
                Image("\(pestName)")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                //segmented
                
                Picker("Result", selection: $selected, content: {
                    Text("Hama")
                        .tag(1)
                    Text("Biopestisida")
                        .tag(2)
                })
                .pickerStyle(.segmented)
                .frame(width: 350)
                .padding()
                
                if selected == 1 {
                    PestScreen()
                } else if selected == 2 {
                    BiopestScreen()
                    
                }
                
         
            }

            
        }
        .navigationBarBackButtonHidden()
        
    }
}

struct PestScreen: View {
    var body: some View {
        ScrollView ( showsIndicators: false){
            VStack(alignment: .leading){
                Text("Deskripsi")
                    .foregroundColor(.pestTitleGreen)
                    .font(.system(.headline, design: .rounded))
                    .padding(.bottom, 2)
                    .bold()
                Text("""
Tanda keparahan serangan kutu daun terlihat dari daun yang terlipat, daun menguning, dan pertumbuhan tanaman yang lambat.
""")
                .foregroundColor(.pestTitleGreen)
                .font(.system(.body, design: .rounded))
                .padding(.bottom, 2)
                
                Text("Ciri-ciri")
                    .foregroundColor(.pestTitleGreen)
                    .font(.system(.headline, design: .rounded))
                    .padding(.bottom, 2)
                    .bold()
                
                Text("""
Berukuran 2-4 mm, bulat lonjong, dan berbadan lunak. Terdiri dari berbagai macam warna: hijau, hitam, merah, kuning, coklat atau abu-abu.
""")
                .foregroundColor(.pestTitleGreen)
                .font(.system(.body, design: .rounded))
                .padding(.bottom, 2)
                
                
                
                Text("Tanaman yang diserang")
                    .foregroundColor(.pestTitleGreen)
                    .font(.system(.headline, design: .rounded))
                    .padding(.bottom, 2)
                    .bold()
                
                Text("""
Terong, tomat, semangka, mentimun,bayam, kacang panjang
""")
                .foregroundColor(.pestTitleGreen)
                .font(.system(.body, design: .rounded))
                .padding(.bottom, 2)
                
                Text("Cara pengurangan")
                    .foregroundColor(.pestTitleGreen)
                    .font(.system(.headline, design: .rounded))
                    .padding(.bottom, 2)
                    .bold()
                
                Text("""
Bersihkan gulma/ rerumputan
Semprot dengan air bertekanan tinggi
Musuh alami: ladybird
""")
                .foregroundColor(.pestTitleGreen)
                .font(.system(.body, design: .rounded))
                .padding(.bottom, 2)
                Text("Recommended biopesticides")
                    .font(.system(.headline, design: .rounded))
                    .padding(.trailing, 80)
                    .foregroundColor(.pestTitleGreen)
                ScrollView(.horizontal, showsIndicators: false) {
                    

                    HStack{
                        //Ganti ke biopesticides default data
                        NavigationLink {
                            BiopesticideView()
                        } label: {
                            ForEach(PestList) { pest in
                                VStack(alignment: .center){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.yellowbg)
                                            .padding(.leading, 20)
                                        Image(pest.image)
                                            .padding(.leading, 20)
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
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

struct BiopestScreen: View {
    var body: some View {
        VStack{
            
            Text("Biopest")
        Spacer()
        }
    }

}
struct PestResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        PestResultScreen()
    }
}
