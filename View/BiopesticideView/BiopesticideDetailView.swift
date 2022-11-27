//
//  BiopesticideDetailView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 13/11/22.
//

import SwiftUI

struct BiopesticideDetailView: View {
    var biopesticide: BiopesticideData
    @State var selected: Int = 1
    @State private var preselectedIndex = 0
    
    var body: some View {
        VStack {
            Image(biopesticide.image)
                .resizable()
                .frame(width: 275, height: 212)
//            Text(biopesticide.name)
//            ForEach(biopesticide.pest){ a in
//                Text(a.name)
//            }
            
            //segmented
            CustomSegmentedControl(preselectedIndex: $preselectedIndex, options: ["Tentang", "Cara Buat"])
                .frame(width: 350)
                .padding(.top, 20)
            Divider().frame(width: 340, height: 1).overlay(Color("segmented"))
                .padding(.bottom, 10)
            
            if preselectedIndex == 0 {
                AboutView(biopesticide: biopesticide)
                    
            } else if preselectedIndex == 1 {
                RecipeView(biopesticide: biopesticide)
            }
            
            Spacer()
        }.navigationTitle(biopesticide.name)
    }
}

struct BiopesticideDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BiopesticideDetailView(biopesticide: biopesticideList[1])
    }
}

struct AboutView: View {
    var biopesticide: BiopesticideData
    
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack{
                Text("Efektif terhadap")
                    .font(.system(size: 16))
                    .font(.system(.callout, design: .rounded))
                    .bold()
                    //.foregroundColor(.pestTitleGreen)
                    .frame(width: 350, height: 25, alignment: .leading)
                   
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(biopesticide.pest) { pest in
                            NavigationLink(destination: Text("ok")) {
                                VStack{
                                    Image(pest.image[0])
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .padding(.leading, 20)
                                    
                                    Text(pest.name)
                                        .padding(.leading, 20)
                                        .font(.system( size: 14, design: .rounded))
                                        .bold()
                                        .foregroundColor(.pestGreen)
                                }
                            }
                        }
                    }.padding(.bottom,10)
                }
                
                Text("Cara Penggunaan")
                    .font(.system(size: 16))
                    .font(.system(.callout, design: .rounded))
                    .bold()
                    //.foregroundColor(.pestTitleGreen)
                    .frame(width: 350, height: 25, alignment: .leading)
                
                Text(biopesticide.usage)
                    .frame(width: 350, alignment: .leading)
                    .padding(.vertical,5)
                    //.background(.blue)
                
            }
        }
    }
}

struct RecipeView: View {
    var biopesticide: BiopesticideData
    var recipeStepImageHeight:CGFloat? = 239
    var recipeStepImageWidth:CGFloat? = 360
    var ingredientsImageWidth:CGFloat? = 66
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            Text("Bahan yang diperlukan")
                .font(.system(size: 16))
                .font(.system(.callout, design: .rounded))
                .bold()
            //.foregroundColor(.pestTitleGreen)
                .frame(width: 350, height: 25, alignment: .leading)
            
            ForEach(0..<biopesticide.ingredient.count){ i in
                Text(biopesticide.ingredient[i])
                    .frame(width: 350, alignment: .leading)
                    .padding(.bottom,2)
            }.padding(.leading,10)
            
            Text("Langkah Pengerjaan")
                .font(.system(size: 16))
                .font(.system(.callout, design: .rounded))
                .bold()
            //.foregroundColor(.pestTitleGreen)
                .frame(width: 350, height: 25, alignment: .leading)
                .padding(.top,15)
            
            ForEach(0..<biopesticide.instruction.count){ i in
                VStack {
                    Section {
                        HStack{
                            Text("\(i+1).")
                            // .padding(.horizontal, 5)
                                .frame(width: 20)
                            Text(biopesticide.instruction[i])
                                .frame(minHeight: 10)
                            
                        }.frame(maxWidth: 350, alignment: .leading)
                        
                        Divider().frame(width: 340)
                    }
                }
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
