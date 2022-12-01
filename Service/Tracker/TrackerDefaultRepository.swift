//
//  Tracker.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation
import CoreData

class TrackerDefaultRepository: TrackerRepository, ObservableObject {

    private let trackerLocalData: TrackerLocalDataStore
    private let localDataStore = TrackerLocalDefaultDataStore()
    public let fethedResulController: NSFetchedResultsController<Tracking>
  
    init(trackerLocalData: TrackerLocalDataStore = TrackerLocalDefaultDataStore() ) {
        self.trackerLocalData = trackerLocalData

        self.fethedResulController = NSFetchedResultsController(fetchRequest: localDataStore.fetchRequest, managedObjectContext: PersistenceController.shared.container.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
    }
//    
//    func fetch() {
//        try? fethedResulController.performFetch()
//        self.biopestArray = fethedResulController.fetchedObjects ?? []
//        
//    }
    func createTracker(plant: String, biopest: String, pest: String, date: Date) -> Tracking {
        let newTracker = trackerLocalData.createTracker(plant: plant, biopest: biopest, pest: pest, datemade: date)
        return newTracker
        trackerLocalData.saveChanges(tracker: newTracker)
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
    
    func saveTracker(tracker: Tracking) {
        trackerLocalData.saveChanges(tracker: tracker)
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


   
    
    
    
    

