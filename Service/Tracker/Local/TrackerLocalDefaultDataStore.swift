//
//  TrackerLocalDefaultDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 28/11/22.
//

import Foundation
import CoreData

class TrackerLocalDefaultDataStore: TrackerLocalDataStore {
    private let container = PersistenceController.shared.container
    var fetchRequest: NSFetchRequest<Tracking> {
        let fetchRequest: NSFetchRequest<Tracking> = Tracking.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        fetchRequest.returnsObjectsAsFaults = false
        
        return fetchRequest
    }
    var context : NSManagedObjectContext {
        container.viewContext
    }
    
    func createTracker(plant: String, biopest: String, pest: String, datemade: Date) -> Tracking {
        let newTracker = Tracking(context: container.viewContext)
        newTracker.id = UUID.init()
        newTracker.plantName = plant
        newTracker.biopestName = biopest
        newTracker.dateStarted = datemade
        return newTracker
    }
    
    func getTracking(id: UUID) throws -> [Tracking]? {
        let fetchRequest = Tracking.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id as CVarArg)
        return try self.container.viewContext.fetch(fetchRequest)
    }
//    func applyBiopest(data: TrackerData) -> Tracking {
//        let newDay = Tracking(context: container.viewContext)
//        newDay.dayApplied = data.appliedDay! + 1
//        return newDay
//
//    }
    
    
    func saveChanges(tracker: Tracking) {
        if tracker.hasChanges {
            try? self.container.viewContext.save()
            print(tracker)
        } else {
            print(" no data saved")
        }
    }
    
    func rollBack() {
        self.container.viewContext.rollback()
    }
    
    
}
