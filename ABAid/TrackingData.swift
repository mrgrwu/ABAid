//
//  TrackingData.swift
//  ABAid
//
//  Created by Greg Wu on 5/18/22.
//

import Foundation

class TrackingData: ObservableObject {
    @Published var actions = [Action]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(actions) {
                UserDefaults.standard.set(encoded, forKey: "Actions")
            }
        }
    }
    
    init() {
        if let savedActions = UserDefaults.standard.data(forKey: "Actions") {
            if let decoded = try? JSONDecoder().decode([Action].self, from: savedActions) {
                actions = decoded
                return
            }
        }
        actions = []
    }
}
