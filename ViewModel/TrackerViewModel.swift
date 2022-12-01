//
//  TrackerViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation
import CoreData

class TrackerViewModel: ObservableObject {
    @Published var tracker: Tracking?
    private var trackerRepository: TrackerRepository
    init(trackerRepository: TrackerRepository = TrackerDefaultRepository()) {
        self.trackerRepository = trackerRepository
//        self.trackerRepository = trackerRepository.createTracker(data: TrackerData())
        self.tracker = trackerRepository.createTracker(data: TrackerData())
    }

    func saveChanges() {
        trackerRepository.saveTracker()

    }

    func addDay(data: Tracking) -> Tracking {
        trackerRepository.applyBiopest(data: data)
    }

    func cancelChanges() {
        trackerRepository.cancelChanges()
    }
    
}
