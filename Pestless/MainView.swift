//
//  MainView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 31/10/22.
//

import SwiftUI
import CoreML

struct MainView: View {
    
    @State private var capturedImage: UIImage? = nil
  //  @State private var isCustomCameraViewPresented = false
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var imageViewModel = SnappedPestViewModel.shared
    @State private var image: Data?
    @State var prediction = String()
    let cameraService = CameraService()
    let model = PestClassifier2()
    @State private var selectedImage: Data? = nil
    
    var body: some View {
        NavigationView{
            ZStack {
                if image != nil {
                    VStack{
                        HStack{
                            Button("Predict") {
                                let image = UIImage(data: image!)?.cgImage
                                let pixel = cameraService.getCVPixelBuffer(image!)
                                let predict = try? model.prediction(image: pixel!)
                                prediction = predict!.classLabel
                                print(predict!.classLabel)
                            }
                            Text(prediction)
                            Button("Save") {
                                imageViewModel.save(id: UUID(), imageData: image!)

                            }
                            
                            NavigationLink("Next", destination: PhotoPreview()
                                .environment(\.managedObjectContext, self.viewContext)
                            
                            )
                        }
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
                
                VStack {
                    Spacer()
                    //coba pake navigate
                    
                    NavigationLink {
                        CustomCameraView(capturedData: $image, selectedImageData: $selectedImage)
                    } label: {
                            Image(systemName: "camera.fill")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.black)
                                .clipShape(Circle())
                      
                    }

                    
                    
                    
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
                    
                }
            }
        }
        
    }
}
    
//    struct MainView_Previews: PreviewProvider {
//        static var previews: some View {
//            MainView()
//        }
//    }
