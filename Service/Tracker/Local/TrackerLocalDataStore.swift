//
//  TrackerLocalDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 28/11/22.
//

import Foundation
import CoreData

protocol TrackerLocalDataStore {
//    func getTrackerbyUserId(userId: UUID) throws -> [Tracking]?
    func createTracker(plant: String, biopest: String, pest: String, datemade: Date ) -> Tracking
//    func applyBiopest(data: TrackerData) -> Tracking
    func getTracking(id: UUID) throws -> [Tracking]?
    func saveChanges(tracker: Tracking)
    func rollBack()
}
