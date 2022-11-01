//
//  Biopesticide.swift
//  Pestless
//
//  Created by Aulia Rahmi on 31/10/22.
//

import Foundation

struct BiopesticideData: Identifiable {
    let id = UUID()
    var name: String = ""
    var description: String = ""
    var usage: [String] = [""]
    var ingredient: [String] = [""]
    var instruction: [String] = [""]
    var image: String = ""
    var pest: [String] = [""]
}
