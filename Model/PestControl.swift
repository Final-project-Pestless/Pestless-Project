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
    PestControl(pest: pestList[0],
                biopest: [biopesticideList[5]]),
    PestControl(pest: pestList[1],
                biopest: [biopesticideList[1],biopesticideList[7]]),
    PestControl(pest: pestList[2],
                biopest: [biopesticideList[1],biopesticideList[2],biopesticideList[3],biopesticideList[4]]),
    PestControl(pest: pestList[3],
                biopest: [biopesticideList[0]]),
    PestControl(pest: pestList[4],
                biopest: [biopesticideList[1],biopesticideList[3],biopesticideList[6]]),

//    PestControl(pest: PestList[0], biopest: [biopesticideList[1], biopesticideList[4]]),
//    PestControl(pest: PestList[1], biopest: [biopesticideList[0], biopesticideList[1]]),
//    PestControl(pest: PestList[2], biopest: [biopesticideList[3], biopesticideList[2]]),
//    PestControl( pest: PestList[3], biopest: [biopesticideList[0]]),
//    PestControl(pest: PestList[4], biopest: [biopesticideList[1]])
]
