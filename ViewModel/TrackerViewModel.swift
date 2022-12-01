//
//  TrackerViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation
import CoreData

class TrackerViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    @Published var tracker: Tracking?
    private var trackerRepository: TrackerRepository
    private var trackerDefaultRepo = TrackerDefaultRepository()
    @Published var fetchedTracker: [Tracking] = []
//    private let fetchedResultController: NSFetchedResultsController<Tracking>

    init(trackerRepository: TrackerRepository = TrackerDefaultRepository()) {
        self.trackerRepository = trackerRepository

        //        self.trackerRepository = trackerRepository.createTracker(data: TrackerData())
        //        self.tracker = trackerRepository.createTracker(date: TrackerData())
    }
    //
    //    func createTracker(plant: String, biopest: String, pest: String, date: Date) {
    //        let newTracker = Trackin
    //        trackerRepository.createTracker(plant: plant, biopest:biopest , pest: pest, date: date)
    //
    //        return newTracker
    //
    //    }
    
    func fetch() {
        let fetchController = trackerDefaultRepo.fethedResulController
        fetchController.delegate = self
        try? fetchController.performFetch()
        self.fetchedTracker = fetchController.fetchedObjects ?? []
        
    }
    func createTracker(plant: String, biopest: String, pest: String, date: Date) {
        let newTracker = trackerRepository.createTracker(plant: plant, biopest: biopest, pest: pest, date: date)
        trackerRepository.saveTracker(tracker: newTracker)
    }
    
    func saveChanges(tracker: Tracking) {
        trackerRepository.saveTracker(tracker: tracker)

    }

    func addDay(data: Tracking) -> Tracking {
        trackerRepository.applyBiopest(data: data)
    }

    func cancelChanges() {
        trackerRepository.cancelChanges()
    }
    
}
