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
    func createTracker(data: TrackerData) -> Tracking
//    func applyBiopest(data: TrackerData) -> Tracking
    func getTracking(id: UUID) throws -> [Tracking]?
    func saveChanges()
    func rollBack()
}
