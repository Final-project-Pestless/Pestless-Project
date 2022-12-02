//
//  TrackerDetailView.swift
//  Pestless
//
//  Created by Local Administrator on 27/11/22.
//

import SwiftUI

struct TrackerDetailView: View {
    var trackingData: Tracking
    
    var body: some View {
//        VStack(alignment: .center, spacing: 20){
//            ZStack {
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(LinearGradient(
//                        gradient: .init(colors: [Color.homeGreen, Color.homeYellow]),
//                        startPoint: .top,
//                        endPoint: .bottom))
//                    .frame(width: 350, height: 400)
//            }.frame( width: 350, height: 400)
//        }
        List {
                Section(header: Text("data lacak")){
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Biopestisida").foregroundColor(.gray)
                            Spacer()
                            Text(trackingData.biopestName ?? "")
                        }
                        HStack {
                            Text("Hama").foregroundColor(.gray)
                            Spacer()
                            Text(trackingData.pestName ?? "")
                        }
                        HStack {
                            Text("Tanaman").foregroundColor(.gray)
                            Spacer()
                            Text(trackingData.plantName ?? "")
                        }
                    }.padding(.all)
                }
            
            
                Section(header: Text("Progres hari ini")){
                    VStack{
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(lineWidth: 20.0)
                                    .opacity(0.2)
                                    .foregroundColor(.green)
                                Circle()
                                    .trim(from: 0.0, to: 0.9)
                                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                                    .foregroundColor(.yellow)
                               
                            }
                            Spacer()
                            VStack {
                                Text("Progres").foregroundColor(.secondary).font(.caption)
                                Text("2%")
                                    .bold()
                                    .font(.system(size: 45))
                                Text("hari").foregroundColor(.secondary).font(.caption)
//                                Text("qwq")
//                                    .font(.title)
                            }
                        }.padding(.vertical)
            //            Text("\"\(progressTemp[][1])\"")
            //                .italic()
            //                .padding(.top)
                    }.padding(.vertical)
                    .frame(width: 300, height: 200)
                    
                    .foregroundColor(.gray)
                }
            
  
            }
    }
}

//struct TrackerDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrackerDetailView()
//    }
//}
