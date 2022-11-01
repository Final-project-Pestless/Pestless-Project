//
//  PestService.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import Foundation
import CoreData


class PestImageData {
    var imageId: UUID?
    var image: Data?
    var pestName: String = ""
    var date: Date?
    
}
class SnappedPestService: SnappedPestLocalDataStore {
    
    private let persistenceController: PersistenceController
    private let container = PersistenceController.shared.container
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    var pestFetchRequest: NSFetchRequest<PestImage> {
        let fetchRequest : NSFetchRequest<PestImage> = PestImage.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "imageId", ascending: false)]
        fetchRequest.returnsObjectsAsFaults = false
        
        return fetchRequest
    }

    var context: NSManagedObjectContext {
        persistenceController.container.viewContext
    }
    
    func createNewPestImage(data: PestImageData) -> PestImage {
        let newPestImage = PestImage(context: context)
        newPestImage.imageId = data.imageId
        newPestImage.pestImage = data.image
        newPestImage.pestName = data.pestName
        return newPestImage
    }
    
    func getpestImage(imageId: UUID) -> [PestImage]? {
        let fetchRequest = PestImage.fetchRequest()
        return try? self.container.viewContext.fetch(fetchRequest)
    }
    
    func saveChanges() {
        do {
            try self.container.viewContext.save()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    func rollback() {
        self.container.viewContext.rollback()
    }
}
