//
//  BiopesticideDetailView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 13/11/22.
//

import SwiftUI

struct BiopesticideDetailView: View {
//    var biop = BiopesticideList[1]
    var biopesticide: BiopesticideData
    @State var selected: Int = 1
    @State private var preselectedIndex = 0
    
//    init(biopesticide: BiopesticideData) {
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("segmented"))
//        UISegmentedControl.appearance().backgroundColor = UIColor(Color("transparent"))
//        self.biopesticide = biopesticide
//    }
    
    var body: some View {
        VStack {
//            Text(biopesticide.name)
//                .foregroundColor(.accentColor)
//                .font(.system(.title2, design: .rounded))
//                .bold()
//                .padding()
            Image("kutu")
                .resizable()
                .frame(width: 275, height: 212)
            Text(biopesticide.name)
            ForEach(biopesticide.pest){ a in
                Text(a.name)
            }
            
            //segmented
            CustomSegmentedControl(preselectedIndex: $preselectedIndex, options: ["Tentang", "Cara Buat"])
                .frame(width: 350)
                .padding(.top, 20)
            Divider().frame(width: 340, height: 1).overlay(Color("segmented"))
                .padding(.bottom, 10)
            
//            Line()
//              .stroke(style: StrokeStyle(lineWidth: 1))
//              .frame(height: 0.5)
//              .foregroundColor(Color("segmented"))
//              .opacity(0.2)
            
            if preselectedIndex == 0 {
                AView()
                    
            } else if preselectedIndex == 1 {
//                AView()
//                    .navigationBarBackButtonHidden()
                Text("ok")
                
            }
            
            
            
//            Picker("Result", selection: $selected, content: {
//
//                Text("Tentang")
//                    .foregroundColor(.pestTitleGreen)
//                    .tag(1)
//                Text("Cara Buat")
//                    .tag(2)
//            })
//            .foregroundColor(.yellowbg)
//            .pickerStyle(.segmented)
//            .frame(width: 350)
//            .padding()
            
//            if selected == 1 {
//                AView()
//                    .navigationBarBackButtonHidden()
//            } else if selected == 2 {
////                AView()
////                    .navigationBarBackButtonHidden()
//                Text("ok")
//
//            }
            
            Spacer()
        }.navigationTitle(biopesticide.name)
//        ZStack {
//            Color.yellowbg
//                .edgesIgnoringSafeArea(.all)
//            Text(biopestiside.name)
//                .font(.headline)
//                .foregroundColor(.pestTitleGreen)
//                .bold()
//                .padding(.bottom, 700)
//            RoundedRectangle(cornerRadius: 45)
//                .frame(width: 392, height: 740)
//                .foregroundColor(.white)
//                .padding(.bottom, 120)
//            ScrollView (){
//                VStack {
//                    Image("0")
//                        .resizable()
//                        .frame(width: 150, height: 150, alignment: .center)
//                        .padding()
//                
//                    VStack(alignment: .leading){
//                        Text("""
//                        this is a makeshift description. this is a makeshift description. this is a makeshift description. this is a makeshift description.
//                        """)
//                        .padding(.bottom, 2)
//                        
//                        Text("Effective on:")
//                            .bold()
//                        
////                        Text("\(biop.pest[0])")
////                            .padding(.bottom, 2)
//                        Text("Arphid, hama kubis,  belalang")
//                            .padding(.bottom,2)
//
//                        Text("Ingredient:")
//                            .bold()
//                        
//                        
//                        Text("""
//100gr bawang putih
//2 sdm minyak sayur
//10 liter air
//10ml sabun cair/detergen
//""")
//                        .padding(.bottom,4)
//                        
//                        Text("Instruction")
//                            .bold()
//                        Text("Campurkan bawang putih yang sudah dihaluskan dengan minyak sayur selama 24 jam, \ntambahkan 1/2 liter air dan sabun, \naduk hingga rata dan saring")
//                            .padding(.bottom,4)
//                        
//                        Text("Usage")
//                            .bold()
//                        Text("Campurkan 10 liter air kedalam larutan aduk rata dan semprotkan pada pagi hari")
//                        
//                  
//                    }.foregroundColor(.pestTitleGreen)
//                        .padding(.horizontal)
//
//                }
//            }
//        }
    }
}

struct BiopesticideDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BiopesticideDetailView(biopesticide: biopesticideList[0])
    }
}

struct AView: View {
    
    
    var body: some View {
        
        ScrollView ( showsIndicators: false){
            VStack(alignment: .leading){
                
                
                Text("Cara pengurangan")
//                ForEach(detectedPest!.preventive) { preventive in
//                    Text(preventive)
//                }
                
                Text("Tanaman Refugia")
                Text("""

""")
               
            }
        }
    }
}

struct CustomSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color("segmented")
    let color2 = Color.white
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = preselectedIndex == index
                ZStack {
                    Rectangle()
                        .fill(color2.opacity(0.2))
                    
                    Rectangle()
                        .fill(isSelected ? color : color2)
                        .cornerRadius(20)
                        .padding(2)
                        .opacity(isSelected ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.1,
                                                             dampingFraction: 2,
                                                             blendDuration: 0.5)) {
                                preselectedIndex = index
                            }
                        }
                }
                .overlay(
                    Text(options[index])
                        //.fontWeight(isSelected ? .bold : .regular)
                        .foregroundColor(isSelected ? .white : Color("AccentColor"))
                )
            }
        }
        .frame(height: 40)
        .cornerRadius(20)
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
