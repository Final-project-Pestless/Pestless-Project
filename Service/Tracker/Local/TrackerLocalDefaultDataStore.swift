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
//
//    func getTrackerbyUserId(userId: UUID) throws -> [Tracking]? {
//        let fetchRequest = Tracking.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "userId == %@", userId as CVarArg)
//        return try self.container.viewContext.fetch(fetchRequest)
//    }
//
    func createTracker(data: TrackerData) -> Tracking {
        let newTracker = Tracking(context: container.viewContext)
        newTracker.id = data.id
        newTracker.dateStarted = data.dateStarted
        newTracker.pestName = data.pestName
        newTracker.biopestName = data.biopestName
        newTracker.plantName = data.plantName
        newTracker.dayApplied = data.appliedDay!
        return newTracker
    }
//
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
    
    
    func saveChanges() {
        try? self.container.viewContext.save()
    }
    
    func rollBack() {
        self.container.viewContext.rollback()
    }
    
    
}
