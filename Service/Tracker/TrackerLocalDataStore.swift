//
//  TrackerLocalDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation

protocol TrackerLocalDataStrore{
    func createTracker() -> Tracking
//    func getTrackerByUserId(userId: String) throws -> [Tracking]
    func saveTracker()
    func rollBack()
}
//
//func getAcneLogsByUserID(userID: String) throws -> [AcneLog]?
//func createNewAcneLog() -> AcneLog
//func saveChanges()
//func rollBack()
