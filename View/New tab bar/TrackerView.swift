//
//  TrackerView.swift
//  Pestless
//
//  Created by Local Administrator on 24/11/22.
//

import SwiftUI

struct TrackerView: View {
    @State var progress = 0.2
    var searchedBiopesticide: [BiopesticideData] = biopesticideList
    @ObservedObject var bookmarkViewModel = BiopestBookmarkViewModel.shared
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \SavedBiopest.id, ascending: true)
    ])
    private var bookmarkedBiopest: FetchedResults<SavedBiopest>
    var body: some View {
        NavigationView{
            VStack {
                Text("Catat progres pemberian biopestisidamu")
                    .foregroundColor(.pestTitleGreen)
                    .bold()
                    .padding()
                
                NavigationLink {
                    TrackerDetailView()
                } label: {
                    
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(LinearGradient(
                                gradient: .init(colors: [Color.cardGreen1, Color.cardGreen2]),
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                            .frame(width: 350, height: 100)
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Ekstrak bawang putih")
                                    .font(.system(.headline, design: .rounded))
                                
                                Text("Kutu daun")
                                    .font(.system(.body, design: .rounded))
                            }
                            .padding(.leading)
                            Spacer()
                            ZStack{
                                ProgressView(value: progress, total: 1.0)
                                    .progressViewStyle(GaugeProgressStyle())
                                    .frame(width: 50, height: 50)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if progress < 1.0 {
                                            withAnimation {
                                                progress += 0.1
                                            }
                                        }
                                    }
                                Text("1/14")
                            }
                            Image(systemName: "chevron.right")
                                .foregroundColor(.pestGreen)
                                .bold()
                                .font(.system(size: 24))
                                .padding(.trailing)
                        }
                    }
                    .frame(width: 350, height: 100)
                }
                VStack(alignment: .leading) {
                    
                    
                    Text("Resep tersimpan")
                        .foregroundColor(.pestTitleGreen)
                        .bold()

                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(bookmarkViewModel.biopestArray, id: \.id) { bio in
                                let biopest = biopesticideList.filter{$0.name == bio.name}
                                NavigationLink {
                                    BiopesticideDetailView(biopesticide: biopest.first!)
                                } label: {
                                    VStack{
                                        Image(bio.image ?? "Bawang putih")
                                            .resizable()
                                            .frame(width: 120, height: 140)
                                        
                                        
                                        Text(bio.name!)
                                            .font(.system(.caption, design: .rounded))
                                            .bold()
                                            .foregroundColor(.grayText)
                                    }
                                }
                                
                                
                            }
                        }
                       
                    }
              
            
                    Text("Biopestisida")
                        .font(.system(size: 16))
                        .font(.system(.callout, design: .rounded))
                        .bold()
                        .foregroundColor(.pestTitleGreen)
                        .padding(.trailing, 240)
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(searchedBiopesticide) { biop in
                                NavigationLink( destination: BiopesticideDetailView(biopesticide: biop)) {
                                    VStack{
                                        Image(biop.image)
                                            .resizable()
                                            .frame(width: 120, height: 140)
                                        
                                        //    }
                                        Text(biop.name)
                                            .font(.system(.caption, design: .rounded))
                                            .bold()
                                            .foregroundColor(.grayText)
                                    }
                                }
                            }
                            
                        }                    }
                
                } .padding(.leading,20)
                Spacer()
            }
            .navigationTitle("Progres")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear{
            bookmarkViewModel.fetch()
        }
    }
}

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.pestGreen
    var strokeWidth = 7.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}
//
//struct TrackerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrackerView()
//    }
//}
