//
//  PestService.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import Foundation
import CoreData

class SnappedPestService {
    private let persistenceController: PersistenceController
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    var pestFetchRequest: NSFetchRequest<Pest> {
        let fetchRequest : NSFetchRequest<Pest> = Pest.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "imageId", ascending: false)]
        fetchRequest.returnsObjectsAsFaults = false
        
        return fetchRequest
    }

    var context: NSManagedObjectContext {
        persistenceController.container.viewContext
    }
}
