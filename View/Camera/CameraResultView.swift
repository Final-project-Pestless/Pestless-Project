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
    let cameraService = CameraService()
    let model = PestClassifier_3()
//    @Binding var selectedImage: Data?
    @State var isDetected: Bool = false
    @State var isResult: Bool = false
    var body: some View {
        NavigationView{
            ZStack {
                if image != nil {
                    VStack{
                        HStack{
                            NavigationLink {
                                CustomCameraView()
                            } label: {
                                Text("Retake")
                            }
                            Spacer()
                            
                            //coba pake navigate
                           
                          
                            Button("Save") {

                                imageViewModel.save(id: UUID(), imageData: image!)
                                let image = UIImage(data: image!)?.cgImage
                                let pixel = cameraService.getCVPixelBuffer(image!)
                                let predict = try? model.prediction(image: pixel!)
                                //prediction = predict!.classLabel
//                                print("\(predict!.classLabel) detected")
//                                print(("\(predict!.classLabelProbs)"))
                                if let output = predict {
                                    let results = output.classLabelProbs.sorted{ $0.1 > $1.1 }.prefix(1)
                                    let result = results.map { (key, value) in
                                        return "<\(key) = \(String(format: "%.1f", value * 100))% detected\n"
                                    }
                                    let results2 = output.classLabelProbs.sorted{ $0.1 > $1.1 }.dropFirst(1).prefix(2)
                                    let result2 = results2.map { (key, value) in
                                        return "\(key) = \(String(format: "%.1f", value * 100))%"
                                    }.joined(separator: "\n")

                                    self.prediction = "\(result)\n"+"\(result2)"
                                }
                                isDetected = true
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                PestResultScreen()
                            } label: {
                                Text("Next")
                            }

                        }
                        .frame(width: 350)
                        Image(uiImage: UIImage(data: image!)!)
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                        
                    }
                }
//                else if selectedImage != nil {
//                    Image(uiImage: UIImage(data: selectedImage!)!)
//                        .resizable()
//                        .scaledToFit()
//                }
                else {
                    Color(UIColor.systemBackground)
                }
                
            }
        }
       
        .alert("\(prediction)", isPresented: $isDetected) {
           
                Text("Ok")
        }
        
    }
}
