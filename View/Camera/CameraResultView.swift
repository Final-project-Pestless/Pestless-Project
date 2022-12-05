//
//  MainView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 31/10/22.
//

import SwiftUI
import CoreML

struct CameraResultView: View {
    
    @State var capturedImage: UIImage? = nil
  //  @State private var isCustomCameraViewPresented = false
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var imageViewModel = SnappedPestViewModel.shared
    @Binding var image: Data?
    @State var prediction = String()
    @State var predictedPest = String()
    @State var percentagePrediction = String()
    @State var percentageDouble: Double = 0
    let cameraService = CameraService()
    let model = PestDetection()
//    @Binding var selectedImage: Data?
    @State var isDetected: Bool = false
    @State var isResult: Bool = false
    @State var pestData : PestData?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
            
         //   if isDetected {
               
//            } else {
      //          NavigationView{

                ZStack {
                    if image != nil {
                        VStack{
                            HStack{
                                Button {
                                    self.presentationMode.wrappedValue.dismiss()
                                    image = nil
                                } label: {
                                    Text("Ambil ulang")
                                }

                                Spacer()
                                                            
                                ZStack {
                                    
                                    
                                    Button("Selesai") {
                                        
                                        let cgImage = UIImage(data: image!)?.cgImage
                                        let pixel = cameraService.getCVPixelBuffer(cgImage!)
                                        let predict = try? model.prediction(image: pixel!)
                                        let pestLabel = predict!.classLabel
                                        //pestlabelnya diubah ke pestdata
                                        //kutu kebul
                                        let pest = pestList.filter{$0.name == pestLabel}
                                        pestData = pest.first
                                        
                                        
                                        if let output = predict {
                                            let results = output.classLabelProbs.sorted{ $0.1 > $1.1 }.prefix(1)
                                            let result = results.map { (key, value) in
                                                percentagePrediction = "\(String(format: "%.1f", value * 100))"
                                                percentageDouble = (value * 100)
                                                return "\(key) = \(String(format: "%.1f", value * 100))% "
                                            }
                                            let results2 = output.classLabelProbs.sorted{ $0.1 > $1.1 }.dropFirst(1).prefix(2)
                                            let result2 = results2.map { (key, value) in
                                                return "\(key) = \(String(format: "%.1f", value * 100))%"
                                            }.joined(separator: "\n")
                                            
                                            self.prediction = "\(result)\n"+"\(result2)"
                                            self.predictedPest = "\(result)"
                                            imageViewModel.save(id: UUID(), imageData: image!, pestName: pestData!.name)
                                            
                                        }
                                        isDetected = true
                                    }
                                    NavigationLink("Next", isActive: $isDetected) {
                                        PestResultView(percentage: $percentagePrediction, detectedPest: $pestData, percentageDouble: $percentageDouble)
                                            .toolbar(.visible, for: .tabBar)
                                        
                                    }
                                    .opacity(0)
                                }
                                
                            }
                            .frame(width: 350)
                            .padding(.top)
                            Spacer()
                            Image(uiImage: UIImage(data: image!)!)
                                .resizable()
                                .scaledToFit()
                                .ignoresSafeArea()
                            Spacer()
                            
                        }
                    }
                    else {
                        Color(UIColor.systemBackground)
                    }
                    
                }
//                .onAppear{
//                    cameraService.stopSession()
//                }
                .toolbar(.visible, for: .tabBar)
                .navigationBarBackButtonHidden()
                
      //      }
        
    }
   
}
