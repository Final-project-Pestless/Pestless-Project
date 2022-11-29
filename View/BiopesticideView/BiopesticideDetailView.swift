//
//  BiopesticideDetailView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 13/11/22.
//

import SwiftUI

struct BiopesticideDetailView: View {
    var biopesticide: BiopesticideData
    @ObservedObject var bookmarViewModel = BiopestBookmarkViewModel.shared
    @State private var preselectedIndex = 0
    @State var isTracker = false
    @State var saved = false
    var body: some View {
        VStack {
            ScrollView (showsIndicators: false) {
                VStack {
                    Image(biopesticide.image)
                        .resizable()
                        .frame(width: 275, height: 180)
                    
                    CustomSegmentedControl(preselectedIndex: $preselectedIndex, options: ["Tentang", "Cara Buat"])
                        .frame(width: 350)
                    // .padding(.top, 20)
                    Divider().frame(width: 340, height: 1).overlay(Color("segmented"))
                        .padding(.bottom, 10)
                    
                    if preselectedIndex == 0 {
                        AboutView(biopesticide: biopesticide)
                        
                    } else if preselectedIndex == 1 {
                        RecipeView(biopesticide: biopesticide)
                    }
                    
                    
                    
                }.navigationTitle(biopesticide.name)
                
            }
            
            Button {
                isTracker = true
            } label: {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 45)
                        .foregroundColor(.pestGreen)
                    Text("Mulai Obati")
                        .foregroundColor(.white)
                }
                
            }
            .padding(.bottom, 15)

        }
        .onAppear{
            bookmarViewModel.fetch()
        }
        .toolbar(content: {
            ToolbarItem(placement:.navigationBarTrailing) {
                
                Button {
                    bookmarViewModel.checkBiopest(id: biopesticide.id)
                    if bookmarViewModel.biopestExist {
                        bookmarViewModel.deleteBiopest(id: biopesticide.id)
                    } else {

                        bookmarViewModel.save(biopest: biopesticide)
                    }
                    bookmarViewModel.fetch()
//
                } label: {
                    if saved {
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(.segmented)
                    } else {
                        Image(systemName: "bookmark")
                    }
                    
                        
                        
                }

            }
        })
        .sheet(isPresented: $isTracker) {
            
        }
    }
}

struct BiopesticideDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BiopesticideDetailView(biopesticide: biopesticideList[1])
    }
}

struct AboutView: View {
    var biopesticide: BiopesticideData
    @State private var pestData: PestData?
    
    var body: some View {
        VStack{
            Text("Efektif terhadap")
                .bold()
                .frame(width: 350, height: 25, alignment: .leading)
                .foregroundColor(.pestGreen)
               
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(biopesticide.pest) { pest in
                        NavigationLink(destination: PestResultDetailView(detectedPest: pest)) {
                            VStack{
                                Image(pest.image[0])
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(.leading, 20)
                                
                                Text(pest.name)
                                    .padding(.leading, 20)
                                    .font(.system(size: 14, design: .rounded))
                                    .bold()
                                    .foregroundColor(.pestGreen)
                            }
                        }
                    }
                }.padding(.bottom,10)
            }
            
            Text("Cara Penggunaan")
                .bold()
                .frame(width: 350, height: 25, alignment: .leading)
                .foregroundColor(.pestGreen)
            
            Text(biopesticide.usage)
                .frame(width: 350, alignment: .leading)
                .padding(.vertical,5)
            
        }.font(.system(size: 16, design: .rounded))
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
                .bold()
                .frame(width: 350, height: 25, alignment: .leading)
                .foregroundColor(.pestGreen)
            
            ForEach(0..<biopesticide.ingredient.count){ i in
                Text(biopesticide.ingredient[i])
                    .frame(width: 350, alignment: .leading)
                    .padding(.bottom,2)
            }.padding(.leading,10)
            
            Text("Langkah Pengerjaan")
                .bold()
                .frame(width: 350, height: 25, alignment: .leading)
                .padding(.top,15)
                .foregroundColor(.pestGreen)
            
            ForEach(0..<biopesticide.instruction.count){ i in
                VStack {
                    Section {
                        HStack{
                            Text("\(i+1).")
                                .frame(width: 20)
                            Text(biopesticide.instruction[i])
                                .frame(minHeight: 10)
                        }.frame(maxWidth: 350, alignment: .leading)
                        
                        Divider().frame(width: 340)
                    }
                }
            }
        }.font(.system(size: 16, design: .rounded))
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
                           // withAnimation(.interactiveSpring(response: 0.1,
                                                         //    dampingFraction: 2,
                                                         //    blendDuration: 0.5)) {
                                preselectedIndex = index
                         //   }
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
