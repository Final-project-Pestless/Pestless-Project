//
//  PestView.swift
//  Pestless
//
//  Created by Local Administrator on 08/11/22.
//

import SwiftUI

struct PestMainView: View {
    @State var searchPest: String = ""
    
    var searchedPest: [PestData] {
        if searchPest.count == 0 {
            return PestList
        } else {
            return PestList.filter{$0.name.lowercased().contains(searchPest.lowercased())}
        }
    }
    
    var body: some View {
        ZStack{
            Color.yellowbg
                .edgesIgnoringSafeArea(.all)
           Text("Pests")
                .font(.headline)
                .bold()
                .padding(.bottom, 700)
            RoundedRectangle(cornerRadius: 45)
                .frame(width: 392, height: 740)
                .foregroundColor(.white)
                .padding(.top, 120)
           
            VStack{
                Text("Common in Your Area")
                    .font(.system(.callout, design: .rounded))
                    .bold()
                    .foregroundColor(.pestTitleGreen)
                    .padding(.trailing, 180)
                    .padding(.vertical)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(searchedPest) { pest in
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
                
                Text("Munches on Your Plants")
                    .font(.system(.callout, design: .rounded))
                    .bold()
                    .foregroundColor(.pestTitleGreen)
                    .padding(.trailing, 170)
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
            .searchable(text: $searchPest, prompt: "Search")
        }
    }
}

struct PestView_Previews: PreviewProvider {
    static var previews: some View {
        PestMainView()
    }
}
