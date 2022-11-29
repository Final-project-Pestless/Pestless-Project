//
//  TrackerViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation
import CoreData

class TrackerViewModel: NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
    @Published var tracker: Tracking?
    private var currentUser: UUID?
    
    private var trackerRepository: TrackerRepository
    init(trackerRepository: TrackerRepository = TrackerDefaultRepository()) {
        self.trackerRepository = trackerRepository
        self.trackerRepository = trackerRepository.createTracker(data: TrackerData()) as! any TrackerRepository
    }
    
}
