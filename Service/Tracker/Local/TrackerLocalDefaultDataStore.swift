//
//  TrackerLocalDefaultDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 28/11/22.
//

import Foundation

class TrackerLocalDefaultDataStore: TrackerLocalDataStore {
 
    
    
    private let container = PersistenceController.shared.container
    
    func getTrackerbyUserId(userId: UUID) throws -> [Tracking]? {
        let fetchRequest = Tracking.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userId == %@", userId as CVarArg)
        return try self.container.viewContext.fetch(fetchRequest)
    }
    
    func createNewLog(pestName: String, bioName: String, plant: String) -> Tracking {
        let newTracker = Tracking(context: container.viewContext)
        newTracker.id = UUID.init()
        newTracker.dateStarted = Date()
        newTracker.pestName = pestName
        newTracker.biopestName = bioName
        newTracker.plantName = plant
        
        return newTracker
    }
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollBack() {
        self.container.viewContext.rollback()
    }
    
    
}
