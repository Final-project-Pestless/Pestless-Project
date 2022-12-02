//
//  DetailPlantView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 29/11/22.
//

import SwiftUI

struct DetailPlantView: View {
    @State var plants: PlantData
    @State private var preselectedIndex = 0
    @State var isChoosePlant: Bool = false
//    @State var date = Date()
    @ObservedObject var plantViewModel = SavedPlantsViewModel.shared
    var body: some View {
    
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
                    
                }
                
                Button {
                    plantViewModel.save(plant: plants)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 45)
                        Text("Tambahkan")
                            .foregroundColor(.white)
                    }
                }
                
               

            }
        
            .navigationTitle(plants.name)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isChoosePlant) {
//                DatePicker("Tanggal mulai memiliki", selection: $date)
            }
            .onAppear{
                plantViewModel.fetch()
            }
            
        
    }
}

struct DetailPlantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlantView(plants: plantList[0])
    }
}
