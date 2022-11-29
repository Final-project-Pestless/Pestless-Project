//
//  BiopestBookmarkProvider.swift
//  Pestless
//
//  Created by Local Administrator on 27/11/22.
//

import Foundation
import CoreData

class BiopestBookmarkProvider {
    
    private let persistenceController : PersistenceController
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    var fetchRequest: NSFetchRequest<SavedBiopest> {
        let fetchRequest: NSFetchRequest<SavedBiopest> = SavedBiopest.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        fetchRequest.returnsObjectsAsFaults = false
        
        return fetchRequest
    }
    var context : NSManagedObjectContext {
        persistenceController.container.viewContext
    }
    func checkResult(id: Int) -> NSFetchRequest<SavedBiopest> {
        
        let fetchRequest: NSFetchRequest<SavedBiopest> = SavedBiopest.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        return fetchRequest
    }
}
