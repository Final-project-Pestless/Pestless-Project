//
//  HistoryDetailView.swift
//  Pestless
//
//  Created by Local Administrator on 28/11/22.
//

import SwiftUI

struct HistoryDetailView: View {
    var image: Data?
    var name: String
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: image!)!)
                .resizable()
                .frame(width: 355, height: 630)
            Text(name)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.pestTitleGreen)
                .bold()
        }
    }
}
//
//struct HistoryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryDetailView()
//    }
//}
