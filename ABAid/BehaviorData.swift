//
//  BehaviorData.swift
//  ABAid
//
//  Created by Greg Wu on 12/15/21.
//

import Foundation

class BehaviorData: ObservableObject {
    @Published var events = [Event]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(events) {
                UserDefaults.standard.set(encoded, forKey: "Events")
            }
        }
    }
    
    init() {
        if let savedEvents = UserDefaults.standard.data(forKey: "Events") {
            if let decoded = try? JSONDecoder().decode([Event].self, from: savedEvents) {
                events = decoded
                return
            }
        }
        events = []
    }
}
