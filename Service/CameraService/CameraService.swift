//
//  CameraService.swift
//  Pestless
//
//  Created by Rahmat Rizky on 31/10/22.
//

import Foundation
import AVFoundation
import CoreML
import UIKit

class CameraService {
    let model = PestClassifier_3()
    var prediction = String()
    
    var session: AVCaptureSession?
    var delegate: AVCapturePhotoCaptureDelegate?
    
    let output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping (Error?) -> ()) {
        self.delegate = delegate
        checkPermissions(completion: completion)
    }
    
    private func checkPermissions(completion: @escaping (Error?) -> ()) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else { return }
                DispatchQueue.main.async {
                    self?.setupCamera(completion: completion)
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCamera(completion: completion)
        @unknown default:
            break
        }
        
    }
    
    private func setupCamera(completion: @escaping (Error?) -> ()) {
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                DispatchQueue.global(qos: .background).async {
                    session.startRunning()
                    self.session = session
                }
              
                
            } catch  {
                completion(error)
            }
            
        }
    }
    
    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()) {
        output.capturePhoto(with: settings, delegate: delegate!)
    }
    func rollBack(image: Data) {
        
    }
    
    func stopSession() {
           if let videoSession = session {
               if videoSession.isRunning {
                   videoSession.stopRunning()
               }
           }
       }
       
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else{
            return
        }
        
        let image = UIImage(data: data)?.cgImage
        let pixel = getCVPixelBuffer(image!)
        let predict = try? model.prediction(image: pixel!)
        prediction = predict!.classLabel
        print(predict!.classLabel)
        print("hello")
        
        //performSegue(withIdentifier: "informationSegue", sender: UIButton.self)
    }
    

    func getCVPixelBuffer(_ image: CGImage) -> CVPixelBuffer? {
            let imageWidth = Int(image.width)
            let imageHeight = Int(image.height)
            let attributes : [NSObject:AnyObject] = [
                kCVPixelBufferCGImageCompatibilityKey : true as AnyObject,
                kCVPixelBufferCGBitmapContextCompatibilityKey : true as AnyObject
            ]
            var pxbuffer: CVPixelBuffer? = nil
            CVPixelBufferCreate(kCFAllocatorDefault,
                                imageWidth,
                                imageHeight,
                                kCVPixelFormatType_32ARGB,
                                attributes as CFDictionary?,
                                &pxbuffer)
            if let _pxbuffer = pxbuffer {
                let flags = CVPixelBufferLockFlags(rawValue: 0)
                CVPixelBufferLockBaseAddress(_pxbuffer, flags)
                let pxdata = CVPixelBufferGetBaseAddress(_pxbuffer)
                let rgbColorSpace = CGColorSpaceCreateDeviceRGB();
                let context = CGContext(data: pxdata,
                                        width: imageWidth,
                                        height: imageHeight,
                                        bitsPerComponent: 8,
                                        bytesPerRow: CVPixelBufferGetBytesPerRow(_pxbuffer),
                                        space: rgbColorSpace,
                                        bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
                if let _context = context {
                    _context.draw(image, in: CGRect.init(x: 0, y: 0, width: imageWidth, height: imageHeight))
                }
                else {
                    CVPixelBufferUnlockBaseAddress(_pxbuffer, flags);
                    return nil
                }
                CVPixelBufferUnlockBaseAddress(_pxbuffer, flags);
                return _pxbuffer;
            }
            return nil
        }
}
