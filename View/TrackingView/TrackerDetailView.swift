//
//  TrackerDetailView.swift
//  Pestless
//
//  Created by Local Administrator on 27/11/22.
//

import SwiftUI

struct TrackerDetailView: View {
    var trackingData: Tracking
    @Binding var arrayDate: [Date]
    @State var dayPassed: Int = 0
    
//    func numberOf24DaysBetween(_ from: Date, and to: Date) -> Int {
//        let numberOfDays = dateComponents([.day], from: from, to: to)
//
//        return numberOfDays.day! + 1
//    }
    func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day! + 1
    }
    
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
                Section(header: Text("Progres hari ini")){
                    VStack{
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(lineWidth: 20.0)
                                    .opacity(0.2)
                                    .foregroundColor(Color("AccentColor"))
                                Circle()
                                    .trim(from: 0.0, to: (CGFloat(trackingData.dayApplied)/7))
                                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                                    .foregroundColor(Color("SecondaryColor"))
                                Text("\(trackingData.dayApplied)/\(21/3)").bold()
                                    .font(.system(size: 45))
                            }
                            Spacer()
                            VStack {
                                Text("Progres").foregroundColor(.secondary).font(.caption)
                                if(trackingData.dateStarted ?? Date() < Date() ) {
                                    Text("\(dayPassed)/21")
                                    .bold()
                                    .font(.system(size: 45))
                                }else{
                                    Text("0/21")
                                    .bold()
                                    .font(.system(size: 45))
                                }
                                Text("hari").foregroundColor(.secondary).font(.caption)
//                                Text("qwq")
//                                    .font(.title)
                            }.foregroundColor(Color("SecondaryColor"))
                        }
            //            Text("\"\(progressTemp[][1])\"")
            //                .italic()
            //                .padding(.top)
                    }.padding(.vertical)
                    .frame(width: 300, height: 200)
                    
                    .foregroundColor(.gray)
                }
            
            Section(header: Text("data lacak")){
                VStack(alignment: .leading) {
                    HStack {
                        Text("Biopestisida").foregroundColor(.gray)
                        Spacer()
                        Text(trackingData.biopestName ?? "")
                    }
                    Divider()
                    HStack {
                        Text("Hama").foregroundColor(.gray)
                        Spacer()
                        Text(trackingData.pestName ?? "")
                    }
                    Divider()
                    HStack {
                        Text("Tanaman").foregroundColor(.gray)
                        Spacer()
                        Text(trackingData.plantName ?? "")
                    }
                    Divider()
                    HStack {
                        Text("Mulai Penyemprotan").foregroundColor(.gray)
                        Spacer()
                        Text(trackingData.dateStarted?.addingTimeInterval(600) ?? Date(), style: .date).multilineTextAlignment(.trailing)
                    }
                    Divider()
                    HStack {
                        Text("Selesai Penyemprotan").foregroundColor(.gray)
                        Spacer()
                        Text(trackingData.dateEnded?.addingTimeInterval(600) ?? Date(), style: .date).multilineTextAlignment(.trailing)
                    }
                }
            }
            
  
        }.onAppear{
            dayPassed = daysBetween(start: trackingData.dateStarted?.addingTimeInterval(600) ?? Date(), end: Date().addingTimeInterval(600))
           // print(trackingData.dateStarted?.formatted(.dateTime.day().month().year()) ?? "nil") //string
           // print(Date().formatted(.dateTime.day().month().year()))
           // print(dayPassed)    //data waktunya ke detect jadi klu belum 24 jam belum terhitung 1 hari
        }
        Spacer()
        
        //BUTTON MUNCUL KALAU TGL HARI INI ADA DATANYA DI ARRAYDATE
        Button {
           //DISINI + 1 DAY APPLIED
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 45)
                    .foregroundColor(.pestGreen)
                Text("Semprot Biopestisida")
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 15)
    }
}

//struct TrackerDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrackerDetailView()
//    }
//}
