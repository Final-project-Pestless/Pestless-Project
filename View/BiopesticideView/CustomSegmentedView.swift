//
//  CustomSegmentedView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 01/12/22.
//

import SwiftUI

struct CustomSegmentedView: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color("AccentColor")
    let color2 = Color("SecondaryColor")
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = preselectedIndex == index
                ZStack {
                    Rectangle()
                        .fill(color2)
                        .frame(height: 45)
                    
                    Rectangle()
                        .fill(isSelected ? color : color2)
                        .frame(width: 156,height: 30)
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
                        .foregroundColor(isSelected ? .white : .black)
                )
            }
        }
        .cornerRadius(20)
    }
}

//struct CustomSegmentedView_Previews: PreviewProvider {
//    @Binding var preselectedIndex
//    static var previews: some View {
//        CustomSegmentedView(preselectedIndex: $preselectedIndex, options: ["Tentang", "Cara Buat"])
//    }
//}