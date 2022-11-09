//
//  File.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import Foundation

protocol SnappedPestLocalDataStore {
   // func createNewPestImage(data: PestImageData) -> PestImage
    func getpestImage(imageId: UUID) -> [PestImage]?
    func saveChanges()
    func rollback()
}
