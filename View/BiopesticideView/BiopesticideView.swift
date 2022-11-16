//
//  BiopesticideView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 11/11/22.
//

import SwiftUI

struct BiopesticideView: View {
    @State var searchBiopesticide: String = ""
    
    var searchedPest: [BiopesticideData] {
        if searchBiopesticide.count == 0 {
            return BiopesticideList
        } else {
            return BiopesticideList.filter{$0.name.lowercased().contains(searchBiopesticide.lowercased())}
        }
    }
    
    var body: some View {
        ZStack{
            Color.yellowbg
                .edgesIgnoringSafeArea(.all)
//            Text("Biopesticides")
//                .font(.headline)
//                .foregroundColor(.pestTitleGreen)
//                .bold()
//                .padding(.bottom, 700)
            RoundedRectangle(cornerRadius: 45)
                .frame(width: 392, height: 740)
                .foregroundColor(.white)
                .padding(.top, 120)
            
            VStack{
                Text("Based on Who Munches Your Plant")
                    .font(.system(size: 16))
                    .font(.system(.callout, design: .rounded))
                    .bold()
                    .foregroundColor(.pestTitleGreen)
                    .padding(.trailing, 80)
                    .padding(.vertical)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(searchedPest) { pest in
                            NavigationLink( destination: BiopesticideDetailView()) {
                                VStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.yellowbg)
                                            .padding(.leading, 20)
                                        Image(pest.image)
                                            .padding(.leading, 20)
                                    }
                                    Text(pest.name)
                                        .padding(.leading, 20)
                                        .font(.system(.caption, design: .rounded))
                                        .bold()
                                        .foregroundColor(.pestGreen)
                                }
                            }
                        }
                        
                    }
                }
                
                Text("Bookmarked")
                    .font(.system(.callout, design: .rounded))
                    .bold()
                    .foregroundColor(.pestTitleGreen)
                    .padding(.trailing, 250)
                    .padding(.vertical)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(PestList) { pest in
                            VStack(alignment: .center){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.yellowbg)
                                        .padding(.leading, 20)
                                    Image(pest.image)
                                        .padding(.leading, 20)
                                }
                                Text(pest.name)
                                    .padding(.leading, 20)
                                    .font(.system(.caption, design: .rounded))
                                    .bold()
                                    .foregroundColor(.pestGreen)
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchBiopesticide, prompt: "Search")
        }
    }
}

struct BiopesticideView_Previews: PreviewProvider {
    static var previews: some View {
        BiopesticideView()
    }
}
