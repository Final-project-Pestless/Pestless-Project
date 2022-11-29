//
//  TrackerLocalDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation

protocol TrackerRepository{
    func createTracker(data: TrackerData) -> Tracking
    func getTrackerByUserId(userId: UUID) -> [Tracking]?
    func saveTracker()
    func rollBack()
}
//
//func getAcneLogsByUserID(userID: String) throws -> [AcneLog]?
//func createNewAcneLog() -> AcneLog
//func saveChanges()
//func rollBack()
class TrackerData {
    var userId: UUID?
    var biopestName: String = ""
    var pestName: String = ""
    var plantName: String = ""
    var dateStarted: Date?
    var dateDone: Date?
}
