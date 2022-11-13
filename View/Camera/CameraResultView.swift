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
    let model = PestClassifier2()
    @Binding var selectedImage: Data?
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
                                prediction = predict!.classLabel
                                print("\(predict!.classLabel) detected")
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
                } else if selectedImage != nil {
                    Image(uiImage: UIImage(data: selectedImage!)!)
                        .resizable()
                        .scaledToFit()
                }
                else {
                    Color(UIColor.systemBackground)
                }
                
//                VStack {
//                    Spacer()
                    //coba pake navigate
                    
//                    NavigationLink {
//                        CustomCameraView()
//                  //      CustomCameraView(capturedData: $image, selectedImageData: $selectedImage)
//                    } label: {
//                            Image(systemName: "camera.fill")
//                                .font(.largeTitle)
//                                .padding()
//                                .background(Color.orange)
//                                .foregroundColor(.black)
//                                .clipShape(Circle())
//
//                    }

                    
                    
                    
                    //versi sheet
//                    Button(action: {
//                        isCustomCameraViewPresented.toggle()
//                    }, label: {
//                        Image(systemName: "camera.fill")
//                            .font(.largeTitle)
//                            .padding()
//                            .background(Color.orangeCamera)
//                            .foregroundColor(.black)
//                            .clipShape(Circle())
//                    })
//                    .padding(.bottom)
//                    .fullScreenCover(isPresented: $isCustomCameraViewPresented, content: {
//                        CustomCameraView(capturedData: $image, selectedImageData: $selectedImage)
//                            .environment(\.managedObjectContext, self.viewContext)
//
//                    })
                    
      //          }
            }
        }
       
        .alert("\(prediction) detected", isPresented: $isDetected) {
           
                Text("Ok")
        }
        
    }
}
    
//    struct MainView_Previews: PreviewProvider {
//        static var previews: some View {
//            MainView()
//        }
//    }