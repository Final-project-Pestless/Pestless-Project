//
//  TrackerLocalDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 28/11/22.
//

import Foundation

protocol TrackerLocalDataStore {
    func getTrackerbyUserId(userId: UUID) throws -> [Tracking]?
    func createNewLog(pestName: String, bioName: String, plant: String) -> Tracking
    func saveChanges()
    func rollBack()
}
