//
//  CustomCameraView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 31/10/22.
//

import Foundation
import SwiftUI
import PhotosUI

struct CustomCameraView: View {
    //  @ObservedObject var viewModel = SnappedPestViewModel(pestService: SnappedPestRepository(persistenceController: PersistenceController()))
    let cameraService = CameraService()
    @State var capturedData: Data?
//    @Environment(\.presentationMode) private var presentationMode
    @State private var selectedItem: PhotosPickerItem?
    @State var selectedImageData: Data?
    @State var isCaptured: Bool = false
    @State var isShown: Bool = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ZStack {
                CameraView(cameraService: cameraService) { result in
                    switch result {
                        
                    case .success(let photo):
                        if let data = photo.fileDataRepresentation() {
                            capturedData = data
                        } else {
                            print("Error: no image data found")
                        }
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
                .ignoresSafeArea(.all)
                
                VStack {
                    
                    HStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .padding(.top, 20)
                                .padding(.leading, 20)
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        }

//                        NavigationLink {
//                            withAnimation(.spring()){
//                                TabBarView()
//                                    .transition(.move(edge: .top))
//                                    .navigationBarBackButtonHidden()
//                            }
//                                } label: {
//                            Image(systemName: "xmark")
//                                .padding(.top, 20)
//                                .padding(.leading, 20)
//                                .font(.system(size: 30))
//                                .foregroundColor(.white)
//                        }
                        
                        Spacer()
                      
                    }
                    
                    Image(systemName: "viewfinder")
                        .font(.system(size: 350, weight: .ultraLight))
                        .foregroundColor(.white)
                        .padding(.top, 130)
                    
                    Text("Place the subject in focus")
                        .italic()
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    HStack{
                        PhotosPicker(selection: $selectedItem) {
                            Image(systemName: "photo.fill")
                                .foregroundColor(.pestGreen)
                                .font(.system(size: 30))
                        }
                        Spacer()
                        ZStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 80))
                                .foregroundColor(.accentColor)
                            
                            Button( action: {
                                cameraService.capturePhoto()
                                isCaptured = true
                            }, label: {
                                Image(systemName: "circle")
                                    .font(.system(size: 72))
                                    .foregroundColor(.white)
                            })
                            
                        }
                        .padding(.trailing, 40)
                        Spacer()
                    }
                    .frame(width: 350)
                    
                    .onChange(of: selectedItem) { newValue in
                        Task{
                            if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                capturedData = data
                                isCaptured = true

                            }
                        }
                    }
                    
                    
                }
            }
            .fullScreenCover(isPresented: $isShown, content: {
                CameraGuidanceView(isShow: $isShown)
                    .background(BackgroundClearView())
            })
            .navigationBarBackButtonHidden(true)
            .fullScreenCover(isPresented: $isCaptured) {
                CameraResultView(image: $capturedData)
                
            
        }
        }
    }
}
struct CustomCameraView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCameraView()
    }
}
