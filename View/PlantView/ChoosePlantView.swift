//
//  ChoosePlantView.swift
//  Pestless
//
//  Created by Local Administrator on 02/12/22.
//

import SwiftUI

struct ChoosePlantView: View {
    @ObservedObject var plantViewModel = SavedPlantsViewModel.shared
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \MyPlants.id, ascending: true)
    ])
    private var myPlants: FetchedResults<MyPlants>
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Image("cegahbg")
                        .padding(.trailing, 195)
//                        .padding(.bottom, 510)
                    
                    Text("Yuk, mulai cegah hama dengan memilih tanaman yang mau dilindungi")
                        .frame(width: 288)
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .font(.system(.body, design: .rounded))
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                }
                
                Divider()
                
                HStack (spacing: 200){
                    Text("Tanamanmu")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .font(.system(.body, design: .rounded))
                    NavigationLink {
                        ListPlantView()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.pestGreen)
                            .font(.system(size: 34))
                        
                            .font(.system(.body, design: .rounded))
                    }
                }
                
                //                        List{
                //                            ForEach(plantList) { plant in
                //                                NavigationLink(destination: DetailPlantView(plants: plant), label: {
                //                                    CardPlantView(plants: plant)
                //                                })
                //                            }
                //                        }
                
                
                ForEach(0..<myPlants.count) { index in
                    //                                let biopest = biopesticideList.filter{$0.name == bio.name}
                    let plants = plantList.filter{$0.name == myPlants[index].plantName}
                    
                    NavigationLink {
                        DetailPlantView(plants: plants.first ?? plantList[0])
                    } label: {
                        
                        CardPlantView(plants: plants.first!)
                        
                        .frame(height: 80)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                    
                    Divider()
                }
                
                
            }
            
            
            
            
            .navigationTitle("Cegah")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                plantViewModel.fetch()
                print(plantViewModel.plantsArray)
                print(myPlants)
            }
        }
        
    }
}
struct ChoosePlantView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlantView()
    }
}
