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
    func createTracker(plant: String, biopest: String, pest: String, dateStarted: Date, dateEnded: Date) {
        let newTracker = trackerRepository.createTracker(plant: plant, biopest: biopest, pest: pest, dateStarted: dateStarted, dateEnded: dateEnded)
        trackerRepository.saveTracker(tracker: newTracker)
        print(newTracker)
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
    
    func dateEnded(date: Date) -> Date {
        let dateEnded = Calendar.current.date(byAdding: .day, value: 21 , to: date) ?? Date()
        return dateEnded

    }
//
    func arrayDate(dateStarted: Date) -> [Date] {
        var arrDate : [Date]
        arrDate = [
            dateStarted.addingTimeInterval(3 * 24 * 60 * 60),
            dateStarted.addingTimeInterval(6 * 24 * 60 * 60),
            dateStarted.addingTimeInterval(9 * 24 * 60 * 60),
            dateStarted.addingTimeInterval(12 * 24 * 60 * 60),
            dateStarted.addingTimeInterval(15 * 24 * 60 * 60),
            dateStarted.addingTimeInterval(18 * 24 * 60 * 60),
            dateStarted.addingTimeInterval(21 * 24 * 60 * 60),
            
        ]

        return arrDate
    }
    func dayAplying(started: Date, ended: Date) {
    }
}


