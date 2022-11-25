//
//  PhotoPreview.swift
//  Pestless
//
//  Created by Local Administrator on 03/11/22.
//

import SwiftUI

struct SnappedHistory: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PestImage.imageId, ascending: true)
    ])
    private var pestImage: FetchedResults<PestImage>
    @State private var image: Data = .init(count: 0)
    
    //new
    @ObservedObject var viewModel = SnappedPestViewModel.shared
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(pestImage, id: \.imageId) { saved in
                VStack{
                    if saved.pestImage != nil {
                        Image(uiImage: UIImage(data: saved.pestImage ?? self.image)!)
                            .resizable()
                            .frame(width: 138, height: 166)
                    } else if saved.pestImage == nil {
                        Text("No saved data")
                    } else {
                        Text("error")
                    }
                }
            }

        }
        .navigationTitle("Riwayat")
//        NavigationView {
//            if viewModel.pestArray.count == 0 {
//                VStack {
//                    Text("No saved image")
//                }
//            } else {
//                ScrollView{
//                    ForEach(viewModel.pestArray, id: \.imageId) { image in
//                        Image(uiImage: UIImage(data: image.pestImage!)!)
//                            .resizable()
//                            .frame(width: 300, height: 300)
//                    }
//                }
//            }
//        }
        .onAppear{
            viewModel.fetch()
        }
        
    }
}

struct PhotoPreview_Previews: PreviewProvider {
    static var previews: some View {
        SnappedHistory()
    }
}
