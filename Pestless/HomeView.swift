//
//  HomeView.swift
//  Macro_CustomTabbar
//
//  Created by Rahmat Rizky on 08/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.yellow
            VStack {
                HStack {
                    Text("Welcome, Eugenia!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.teal)
                        .padding(.top)
                        .padding(.bottom)
                    
                    Button(action: {
                    }, label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top)
                            .padding(.bottom)
                    })
                }
                
                VStack(alignment: .center, spacing: 20){
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                        }, label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 7.8, height: 12.75)
                                .foregroundColor(.white)
                        })
                        
                        Text("Monday, 7 November")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                        
                        Button(action: {
                        }, label: {
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 7.8, height: 12.75)
                                .foregroundColor(.white)
                        })
                    }
                    .padding(.top, 17)
                    
                    HStack {
                        VStack {
                            Image(systemName: "cloud.rain.fill")
                                .resizable()
                                .frame(width: 45, height: 40.91)
                                .foregroundColor(.white)
                            
                            Text("30°C")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .padding(.vertical,14)
                                .padding(.horizontal, 16)
                        }
                        Spacer()
                        
                        VStack {
                            Image(systemName: "wind")
                                .resizable()
                                .frame(width: 45, height: 40.91)
                                .foregroundColor(.white)
                            
                            Text("24 m/s")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .padding(.vertical,14)
                                .padding(.horizontal, 16)
                        }
                        Spacer()
                        
                        VStack {
                            
                            Text("Batam, Indonesia")
                                .multilineTextAlignment(.center)
                                .frame(alignment: .center)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.bottom,14)
                            
                            
                            Text("It’s going to rain today at 10:00 AM.")
                                .multilineTextAlignment(.center)
                                .frame(width: 90, alignment: .center)
                                .font(.system(size: 12, weight: .regular))
                                .lineLimit(3)
                                .foregroundColor(.white)
                                .padding(.horizontal,16)
                                .padding(.bottom,10)
                        }
                    }
                }
                
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(.teal))
                .frame(width: 340, height: 150)
                
                HStack {
                    Text("Plants")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.teal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25)
                        .padding(.top, 15)
                    
                    Button(action: {
                    }, label: {
                        Image(systemName: "plus")
                            .fontWeight(.bold)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.teal)
                            .padding(.trailing, 21)
                            .padding(.top, 15)
                        
                    })
                }
                
                ForEach(0..<CollectionViewCell.row) { i in
                    HStack {
                        ForEach(0..<CollectionViewCell.column) { j in
                            CollectionViewCell()
                                .padding(5)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}


struct CollectionViewCell: View {
    static let column = 3
    static let row = 6
    let width = (UIScreen.main.bounds.width/3)-20
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.teal)
            
            Text("Mangga")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.teal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
