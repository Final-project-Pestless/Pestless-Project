//
//  SavedPlantProvider.swift
//  Pestless
//
//  Created by Local Administrator on 01/12/22.
//

import Foundation
import CoreData

class SavedPlantProvider {
    private let persistenceController: PersistenceController
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    var fetchRequest: NSFetchRequest<MyPlants> {
        let fetchRequest: NSFetchRequest<MyPlants> = MyPlants.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        fetchRequest.returnsObjectsAsFaults = false
        return fetchRequest
    }
    
    var context: NSManagedObjectContext {
        persistenceController.container.viewContext
    }
    
    func checkResult(id: UUID) -> NSFetchRequest<MyPlants> {
        let fetchRequest: NSFetchRequest<MyPlants> = MyPlants.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        return fetchRequest
    }
}
