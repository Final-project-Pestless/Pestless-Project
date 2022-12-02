//
//  PestResultScreen.swift
//  Pestless
//
//  Created by Local Administrator on 11/11/22.
//

import SwiftUI

struct PestResultDetailView: View {
    @State private var preselectedIndex = 0
    @State var detectedPest : PestData?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ScrollView {
            VStack {
                Image(detectedPest?.image[0] ?? "kutu")
                    .resizable()
                    .frame(width: 275, height: 180)
                
                CustomSegmentedView(preselectedIndex: $preselectedIndex, options: ["Biopestisida","Alternatif"])
                    .frame(width: 350)
                
                if preselectedIndex == 0 {
                    let pestControl = pestControlList.filter{$0.pest?.name == detectedPest?.name}
                    BiopestScreen(detectedPest: $detectedPest, pestControl: pestControl.first ?? pestControl[0]) //defaultnya salah
                } else if preselectedIndex == 1 {
                    PestControlView(detectedPest: $detectedPest)
                }
                
                Spacer()
            }
        }.navigationTitle(detectedPest?.name ?? "Pest")
         .navigationBarTitleDisplayMode(.inline)
    }
}

struct PestControlView: View {
    @Binding var detectedPest : PestData?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Cara Pengurangan")
                .foregroundColor(.pestTitleGreen)
            
            ForEach(0..<(detectedPest?.preventive.count)!) { i in
                HStack(alignment: .top) {
                    Text("•")
                        .frame(width: 20)
                    Text(detectedPest?.preventive[i] ?? "No prevention data")
                        .foregroundColor(.grayText)
                }
            }
            Divider()
                .foregroundColor(.orangeColor)
                .padding(.vertical,8)
            Text("Tanaman Musuh Alami")
                .foregroundColor(.pestTitleGreen)
            
            Text(detectedPest?.eat ?? "predator")
        }.font(.system(size: 16, design: .rounded))
        .padding(.horizontal,25)
    }
}

struct BiopestScreen: View {
    @Binding var detectedPest : PestData?
    var pestControl: PestControl
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(pestControl.biopest!) { biopest in
                VStack(alignment: .leading){
                    NavigationLink( destination: BiopesticideDetailView(biopesticide: biopest)
                    ) {
                        VStack(alignment: .leading){
                            ZStack{
                                Image(biopest.image)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            Text(biopest.name)
                                .font(.system(.caption, design: .rounded))
                                .bold()
                                .foregroundColor(.pestGreen)
                        }
                    }
                }
            }
        }
    }
}

struct PestResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        PestResultDetailView(detectedPest: pestList[0])
    }
}
