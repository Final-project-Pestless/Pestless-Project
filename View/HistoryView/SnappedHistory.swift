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
    
    //new
    let layout = [
        GridItem(.adaptive(minimum:150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: layout) {
                    ForEach(pestImage, id: \.imageId) { saved in
                        NavigationLink {
                            HistoryDetailView(image: saved.pestImage, name: saved.pestName!)
                        } label: {
                            VStack{
                                if saved.pestImage != nil {
                                    Image(uiImage: UIImage(data: saved.pestImage ?? self.image)!)
                                        .resizable()
                                        .frame(width: 135, height: 240)
                                    Text(saved.pestName ?? "No name saved")
                                        .foregroundColor(.pestTitleGreen)
                                        .font(.system(.caption))
                                        .bold()
                                } else if saved.pestImage == nil {
                                    Text("No saved data")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Riwayat")
            .navigationBarTitleDisplayMode(.inline)
        }
      
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
