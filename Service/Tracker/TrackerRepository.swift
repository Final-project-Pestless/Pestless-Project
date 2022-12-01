//
//  TrackerLocalDataStore.swift
//  Pestless
//
//  Created by Local Administrator on 26/11/22.
//

import Foundation

protocol TrackerRepository{
    func createTracker(data: TrackerData) -> Tracking
    func getTracker(id: UUID) -> [Tracking]?
    func applyBiopest(data: Tracking) -> Tracking
    func saveTracker()
    func cancelChanges()
}
//
//func getAcneLogsByUserID(userID: String) throws -> [AcneLog]?
//func createNewAcneLog() -> AcneLog
//func saveChanges()
//func rollBack()
class TrackerData {
    var id: UUID?
    var biopestName: String = ""
    var pestName: String = ""
    var plantName: String = ""
    var dateMade: Date?
    var dateStarted: Date?
    var dateDone: Date?
    var appliedDay: Int32? = 0 //jumlah hari dia pencet apply
    var percentage: Float = 0
}
