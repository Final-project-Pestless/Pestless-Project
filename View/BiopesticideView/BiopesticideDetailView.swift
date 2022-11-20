//
//  BiopesticideDetailView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 13/11/22.
//

import SwiftUI

struct BiopesticideDetailView: View {
//    var biop = BiopesticideList[1]
    var biopestiside: BiopesticideData
    
    var body: some View {
        ZStack {
            Color.yellowbg
                .edgesIgnoringSafeArea(.all)
            Text(biopestiside.name)
                .font(.headline)
                .foregroundColor(.pestTitleGreen)
                .bold()
                .padding(.bottom, 700)
            RoundedRectangle(cornerRadius: 45)
                .frame(width: 392, height: 740)
                .foregroundColor(.white)
                .padding(.bottom, 120)
            ScrollView (){
                VStack {
                    Image("0")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .padding()
                
                    VStack(alignment: .leading){
                        Text("""
                        this is a makeshift description. this is a makeshift description. this is a makeshift description. this is a makeshift description.
                        """)
                        .padding(.bottom, 2)
                        
                        Text("Effective on:")
                            .bold()
                        
//                        Text("\(biop.pest[0])")
//                            .padding(.bottom, 2)
                        Text("Arphid, hama kubis,  belalang")
                            .padding(.bottom,2)

                        Text("Ingredient:")
                            .bold()
                        
                        
                        Text("""
100gr bawang putih
2 sdm minyak sayur
10 liter air
10ml sabun cair/detergen
""")
                        .padding(.bottom,4)
                        
                        Text("Instruction")
                            .bold()
                        Text("Campurkan bawang putih yang sudah dihaluskan dengan minyak sayur selama 24 jam, \ntambahkan 1/2 liter air dan sabun, \naduk hingga rata dan saring")
                            .padding(.bottom,4)
                        
                        Text("Usage")
                            .bold()
                        Text("Campurkan 10 liter air kedalam larutan aduk rata dan semprotkan pada pagi hari")
                        
                  
                    }.foregroundColor(.pestTitleGreen)
                        .padding(.horizontal)

                }
            }
        }
    }
}

struct BiopesticideDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BiopesticideDetailView(biopestiside: BiopesticideList[0])
    }
}
