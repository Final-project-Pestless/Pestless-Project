//
//  Tracker.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation

class TrackerDefaultRepository: TrackerRepository {

    private let trackerLocalData: TrackerLocalDataStore
    
    init(trackerLocalData: TrackerLocalDataStore = TrackerLocalDefaultDataStore() ) {
        self.trackerLocalData = trackerLocalData
    }
    
    
    func createTracker(data: TrackerData) -> Tracking {
        let newTracker = trackerLocalData.createTracker(data: data)
        return newTracker
    }
    
    func getTracker(id: UUID) -> [Tracking]? {
        do {
            guard let tracker = try trackerLocalData.getTracking(id: id)
            else {return [] }
            
            return tracker
        } catch {
            print(error)
            return []
        }
    }
  
    func applyBiopest(data: Tracking) -> Tracking {
        data.dayApplied += 1
        return data
    }
    
    func saveTracker() {
        trackerLocalData.saveChanges()
    }
    
    func cancelChanges() {
        trackerLocalData.rollBack()
    }
  
//
//    func calculatePercentage(dateStarted: Date, now: Date) -> Int{
//        let dateEnded = dateStarted + 21
//
//
//    }
}
