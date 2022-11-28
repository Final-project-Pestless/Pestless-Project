//
//  ListPlantView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 29/11/22.
//

import SwiftUI

struct CardPlantView: View {
    var plants: PlantData
    //    @State private var preselectedIndex = 0
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(plants.name)
                //                    .frame(height: 80)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                
                Text("nama latin goes here")
                    .fontWeight(.light)
            }
            
            Spacer()
            
            Image(plants.image)
                .resizable()
            //                .frame(width: 80, height: 60)
                .scaledToFit()
                .frame(height: 60)
            
        }.frame(height: 80)
            .padding(.leading, 20)
            .padding(.trailing, 20)
        //                    .border(Color.pestGreen)
        
    }
}


struct ListPlantView: View {
    var plants: PlantData
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<plantList.count) { i in
                    NavigationLink(destination: DetailPlantView(plants: plants), label: {
                        CardPlantView(plants: plantList[i])
                    })
                }
            }
            
        }
        .navigationTitle("Lists")
    }
}



struct ListPlantView_Previews: PreviewProvider {
    static var previews: some View {
        ListPlantView(plants: plantList[0])
    }
}
