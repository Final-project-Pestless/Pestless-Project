//
//  TrackerLocalDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation

protocol TrackerRepository{
    func createTracker(plant: String, biopest: String, pest: String, dateStarted: Date, dateEnded: Date) -> Tracking
    func getTracker(id: UUID) -> [Tracking]?
    func applyBiopest(data: Tracking) -> Tracking
    func saveTracker(tracker: Tracking)
    func cancelChanges()
}

