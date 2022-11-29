//
//  TrackerViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation
import CoreData
//
//class TrackerViewModel: NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
//    @Published var tracker: Tracking?
//    @Published var trackers: [Tracking] = []
//    private let trackerRepository: TrackerRepository
//    
//    static let shared = TrackerViewModel(trackerRepository: TrackerRepository(persistenceController: PersistenceController.shared))
//    
//    init( trackerRepository: TrackerRepository) {
//        self.trackerRepository = trackerRepository
//    }
//    
//    func saveChanges() {
//        guard let currentTracker = self.tracker else { return }
//        
//        trackerRepository.createTracker()
//    }
//
//    func saveChanges(){
//        guard let currentAcneLog = self.acneLog else{return}
//
//        userRepository.addNewAcneLog(id: currentUserID, acneLog: currentAcneLog)
//        acneLogRepository.addAcneLogUnlockProductsByUserID(userID: currentUserID, acneLog: currentAcneLog)
//
//        acneLogRepository.saveChanges()
//    }
//    }
