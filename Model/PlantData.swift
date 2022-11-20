//
//  PlantData.swift
//  Pestless
//
//  Created by Local Administrator on 16/11/22.
//

import Foundation
struct PlantData : Identifiable{
    var id : UUID = UUID()
    var name: String
    var pest: [PestData]?
    var biopesticide: [BiopesticideData]?
}

let plantList: [PlantData] = [
    PlantData(name: "Bayam"),
    PlantData(name: "Cabai")
]
