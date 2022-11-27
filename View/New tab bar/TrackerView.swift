//
//  TrackerView.swift
//  Pestless
//
//  Created by Local Administrator on 24/11/22.
//

import SwiftUI

struct TrackerView: View {
    @State var progress = 0.2
    var body: some View {
        NavigationView{
            VStack {
                Text("Catat progres pemberian biopestisidamu disini")
                    .foregroundColor(.pestTitleGreen)
                    .padding()
                
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
                    }
                }
                .frame(width: 350, height: 100)
                Spacer()
                
                
            }
            .navigationTitle("Progres")
            .navigationBarTitleDisplayMode(.inline)
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

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
