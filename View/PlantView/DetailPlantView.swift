//
//  DetailPlantView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 29/11/22.
//

import SwiftUI

struct DetailPlantView: View {
    var plants: PlantData
    @State private var preselectedIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Image(plants.image)
                        .resizable()
                        .frame(width: 345, height: 200)
                        .padding(.top, 5)
                    
                    
                    Divider()
//                        .frame(minHeight: 1)
                        .overlay(Color.gray)
                    
                    HStack {
                        Text("Kondisi Ideal ")
                            .foregroundColor(.pestGreen)
                            .fontWeight(.bold)
                            .padding(.leading, 25)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                    
                    ForEach(0..<plants.ideal.count) { i in
                        Text(plants.ideal[i])
                            .frame(width: 350, alignment: .leading)
                            .padding(.bottom,2)
                    }.padding(.leading,10)
                    
                    Divider()
//                        .frame(minHeight: 1)
                        .overlay(Color.gray)
                    
                    HStack {
                        Text("Hama Pengganggu")
                            .foregroundColor(.pestGreen)
                            .fontWeight(.bold)
                            .padding(.leading, 25)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                    
                    ForEach(0..<plants.hama.count) { i in
                        Text(plants.hama[i])
                            .frame(width: 350, alignment: .leading)
                            .padding(.bottom,2)
                    }.padding(.leading,10)
                    
                    Divider()
//                        .frame(minHeight: 1)
                        .overlay(Color.gray)
                    
                    HStack {
                        Text("Pencegahan Hama")
                            .foregroundColor(.pestGreen)
                            .fontWeight(.bold)
                            .padding(.leading, 25)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                    
                    ForEach(0..<plants.pestControl.count) { i in
                        Text(plants.pestControl[i])
                            .frame(width: 350, alignment: .leading)
                            .padding(.bottom,2)
                    }.padding(.leading,10)
                    
//                    Spacer()
                    
                        .navigationTitle(plants.name)
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct DetailPlantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlantView(plants: plantList[0])
    }
}
