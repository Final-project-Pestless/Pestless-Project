//
//  PestResultScreen.swift
//  Pestless
//
//  Created by Local Administrator on 11/11/22.
//

import SwiftUI

struct PestResultDetailView: View {
    @State var selected: Int = 1
    @Binding var detectedPest : PestData?
    var body: some View {
        ScrollView {
            VStack {
                    
                    Text(detectedPest?.name ?? "no")
                        .foregroundColor(.accentColor)
                        .font(.system(.title2, design: .rounded))
                        .bold()
                        .padding()
                    Image("kutu")
                        .resizable()
                        .frame(width: 325, height: 250)
                        .padding()
                    //segmented
                    
                    Picker("Result", selection: $selected, content: {
                        Text("Langkah awal")
                            .foregroundColor(.pestTitleGreen)
                            .tag(1)
                        Text("Biopestisida")
                            .tag(2)
                    })
                    .foregroundColor(.yellowbg)
                    .pickerStyle(.segmented)
                    .frame(width: 350)
                    .padding()
                    
                    if selected == 1 {
                        PestControlView(detectedPest: $detectedPest)
                            .navigationBarBackButtonHidden()
                    } else if selected == 2 {
                        BiopestScreen(detectedPest: $detectedPest)
                            .navigationBarBackButtonHidden()
                        
                    }
                    
                    Spacer()
            }
        }
        
    }
}

struct PestControlView: View {
    @Binding var detectedPest : PestData?
    
    var body: some View {
        
        ScrollView ( showsIndicators: false){
            VStack(alignment: .leading, spacing: 5){
                
                
                Text("Cara pengurangan")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.pestTitleGreen)

                ForEach(0..<(detectedPest?.preventive.count)!) { i in
                    Text(detectedPest?.preventive[i] ?? "No prevention data")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.grayText)
                }
                Divider()
                    .foregroundColor(.orangeColor)
                Text("Tanaman musuh alami")
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.pestTitleGreen)
                
                Text(detectedPest?.eat ?? "predator")
            }
            .padding()
        }
    }
}

struct BiopestScreen: View {
    @Binding var detectedPest : PestData?
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading){
                Text("test")
//                ForEach(detectedPest!.biopests) { biopest in
//                    VStack(alignment: .leading){
//                        NavigationLink( destination: BiopesticideDetailView(biopestiside: biopest)
//                            .navigationBarBackButtonHidden()
//                        ) {
//                            VStack(alignment: .leading){
//                                ZStack{
//                                    RoundedRectangle(cornerRadius: 16)
//                                        .frame(width: 100, height: 100)
//                                        .foregroundColor(.yellowbg)
//                                        .padding(.leading, 20)
//                                    Image(biopest.image)
//                                        .padding(.leading, 20)
//                                }
//                                Text(biopest.name)
//                                    .padding(.leading, 20)
//                                    .font(.system(.caption, design: .rounded))
//                                    .bold()
//                                    .foregroundColor(.pestGreen)
//                            }
//                        }
//                    }
//                }
            }
        }
    }
    
}
//struct PestResultScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        PestResultDetailView()
//    }
//}
