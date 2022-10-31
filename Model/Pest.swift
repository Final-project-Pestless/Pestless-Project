//
//  Pest.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import Foundation
import SwiftUI


public class PestData {
    var pestId: Int32?
    var pestName: String?
    var pestDetail: String?
    var pestImage: UIImage?
    
    init(pestId: Int32, pestName: String, pestDetail: String, pestImage: UIImage) {
        self.pestId = pestId
        self.pestName = pestName
        self.pestDetail = pestDetail
        self.pestImage = pestImage
    }
}
