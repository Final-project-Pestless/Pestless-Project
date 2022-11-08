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
    @Binding var capturedData: Data?
    @Environment(\.presentationMode) private var presentationMode
    @State private var selectedItem: PhotosPickerItem?
    @Binding var selectedImageData: Data?
    var body: some View {
        ZStack {
            CameraView(cameraService: cameraService) { result in
                switch result {
                    
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        //   capturedImage = UIImage(data: data)
                        capturedData = data
                        
                        presentationMode.wrappedValue.dismiss()
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
                    Button( action:  {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    })
                    Spacer()
                    PhotosPicker(selection: $selectedItem) {
                        Image(systemName: "photo.fill")
                    }
                    
                    .onChange(of: selectedItem) { newValue in
                        Task{
                            if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
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
                ZStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.hijauShutter)
                    
                    Button( action:  {
                        cameraService.capturePhoto()
                      
                    }, label: {
                        Image(systemName: "circle")
                            .font(.system(size: 72))
                            .foregroundColor(.white)
                    })
                }
            }
        }
    }
}
