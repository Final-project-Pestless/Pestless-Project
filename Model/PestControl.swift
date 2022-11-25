//
//  PestControl.swift
//  Pestless
//
//  Created by Local Administrator on 24/11/22.
//

import Foundation

struct PestControl: Identifiable {
    var id = UUID()
    var pest: PestData?
    var biopest: [BiopesticideData]?
    
    
}

let pestControlList: [PestControl] = [
    PestControl(pest: PestList[0], biopest: [biopesticideList[0], biopesticideList[1]]),
    PestControl(pest: PestList[1], biopest: [biopesticideList[3]]),
]
