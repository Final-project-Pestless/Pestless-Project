//
//  TrackerView.swift
//  Pestless
//
//  Created by Local Administrator on 24/11/22.
//

import SwiftUI

struct TrackerView: View {
    var body: some View {
        VStack {
            Text("Catat progres pemberian biopestisidamu disini")
                .foregroundColor(.pestTitleGreen)
            Spacer()
        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
