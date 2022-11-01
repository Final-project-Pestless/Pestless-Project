//
//  CustomCameraView.swift
//  Pestless
//
//  Created by Rahmat Rizky on 31/10/22.
//

import Foundation
import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?

    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            CameraView(cameraService: cameraService) { result in
                switch result {
                    
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
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
                   // .padding(.bottom)
                    
                   
                }
            }
        }
    }
}
