//
//  PestResultScreen.swift
//  Pestless
//
//  Created by Local Administrator on 11/11/22.
//

import SwiftUI

struct PestResultDetailView: View {
    @State var selected: Int = 1
    @State var detectedPest : PestData?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    Text(detectedPest?.name ?? "no")
                        .foregroundColor(.accentColor)
                        .font(.system(.title2, design: .rounded))
                        .bold()
                        .padding()
                    Image(detectedPest?.image[0] ?? "kutu")
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
                        //MASIH DI SET NILAI DEFAULT
                        BiopestScreen(detectedPest: $detectedPest, pestControl: pestControlList[0])
                            .navigationBarBackButtonHidden()
                        
                    }
                    
                    Spacer()
                }
            }
            
            //            .navigationBarItems(leading:
            //            Button(action: {
            //                self.presentationMode.wrappedValue.dismiss()
            //            }, label: {
            //                Image(systemName: "chevron.left")
            //            })
            //        )
        }
        .navigationTitle("Detail hama")
        .navigationBarTitleDisplayMode(.inline)
        //        .navigationBarBackButtonHidden()
        
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
    
    var pestControl: PestControl
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading){
               // Text("test")
                if (detectedPest?.name ?? "" == pestControl.pest?.name ?? "") {
                    ForEach(pestControl.biopest!) { biopest in
                        VStack(alignment: .leading){
                            NavigationLink( destination: BiopesticideDetailView(biopesticide: biopest)
                                .navigationBarBackButtonHidden()
                            ) {
                                VStack(alignment: .leading){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.yellowbg)
                                            .padding(.leading, 20)
                                        Image(biopest.image)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .padding(.leading, 20)
                                    }
                                    Text(biopest.name)
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
        }
    }
    
}

//struct BiopestScreen: View {
//    @Binding var detectedPest : PestData?
//    @State var biopest = biopesticideList
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack(alignment: .leading){
//                Text("test")
                
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
//            }
//        }
//    }
//
//}
//struct PestResultScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        PestResultDetailView()
//    }
//}
