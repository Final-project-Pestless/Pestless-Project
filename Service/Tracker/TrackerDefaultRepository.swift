//
//  Tracker.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation
import CoreData

class TrackerDefaultRepository: TrackerRepository {
    
    
    private let trackerLocalData: TrackerLocalDataStore
    
    init(trackerLocalData: TrackerLocalDefaultDataStore) {
        self.trackerLocalData = trackerLocalData
    }
    
    
    func createTracker(data: TrackerData) -> Tracking {
        let newTracker = trackerLocalData.createNewLog(pestName: data.pestName, bioName: data.biopestName, plant: data.plantName)
        return newTracker
    }
    
    func getTrackerByUserId(userId: UUID) -> [Tracking]? {
        do {
            guard let tracker = try trackerLocalData.getTrackerbyUserId(userId: userId) else { return []}
            
            return tracker
        } catch {
            print(error)
            return []
        }
    }
    
    func saveTracker() {
        trackerLocalData.saveChanges()
    }
    
    func rollBack() {
        trackerLocalData.rollBack()
    }
  
}
