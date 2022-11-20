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
            RoundedRectangle(cornerRadius: 45)
                .frame(width: 392, height: 740)
                .foregroundColor(.white)
                .padding(.top, 120)
            if searchPest.count == 0 {
                VStack{
                    Text("Potential pests")
                        .font(.system(.callout, design: .rounded))
                        .bold()
                        .foregroundColor(.pestTitleGreen)
                        .padding(.trailing, 230)
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
                                        Image(pest.image[0])
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
                                        Image(pest.image[0])
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
                    .padding(.bottom, 170)
                }

            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(searchedPest) { pest in
                            VStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.yellowbg)
                                        .padding(.leading, 20)
                                    Image(pest.image[0])
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

        }
        .navigationBarBackButtonHidden()
        .searchable(text: $searchPest, prompt: "Search")
    }
}

struct PestView_Previews: PreviewProvider {
    static var previews: some View {
        PestMainView()
    }
}
