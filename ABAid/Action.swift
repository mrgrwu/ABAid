//
//  Action.swift
//  ABAid
//
//  Created by Greg Wu on 5/18/22.
//

import Foundation

struct Action: Identifiable, Codable {
    var id = UUID()
    var description: String = ""
    var count: Int = 0
}
