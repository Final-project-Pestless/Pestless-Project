//
//  Tracker.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation
import CoreData

class TrackerRepository: TrackerLocalDataStrore {
  
    
  
    
    private let persistenceController: PersistenceController
    private let container = PersistenceController.shared.container
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func createTracker() -> Tracking {
        let newTracker = Tracking(context: container.viewContext)
        newTracker.id = UUID.init()
        newTracker.dateStarted = Date()
        return newTracker
    }
    
    func saveTracker() {
        try? self.container.viewContext.save()
    }

    func rollBack() {
        self.container.viewContext.rollback()
    }
    //
    //    func getTrackerByUserId(userId: String) throws -> [Tracking] {
    //        <#code#>
    //    }
        
}
