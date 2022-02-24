//
//  Event.swift
//  ABAid
//
//  Created by Greg Wu on 12/15/21.
//

import Foundation

struct Event: Identifiable, Codable {
    var id = UUID()
    var when = Date()
    var antecedent: String = ""
    var behavior: String = ""
    var consequence: String = ""
    var functionSelection: Int = 0
}
