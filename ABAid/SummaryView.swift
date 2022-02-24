//
//  SummaryView.swift
//  ABAid
//
//  Created by Greg Wu on 12/14/21.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var aBCDataCopy: BehaviorData
    
    var accessCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 0 {
                count += 1
            }
        }
        return count
    }
    var avoidanceCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 1 {
                count += 1
            }
        }
        return count
    }
    var attentionCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 2 {
                count += 1
            }
        }
        return count
    }
    var sensoryCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 3 {
                count += 1
            }
        }
        return count
    }
    var combinationCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 4 {
                count += 1
            }
        }
        return count
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Number of events").fontWeight(.semibold) + Text(": \(aBCDataCopy.events.count)")
                }
                Section(header: Text("Functions of Behavior")) {
                    Text("Access").fontWeight(.semibold) + Text(": \(accessCount)")
                    Text("Avoidance").fontWeight(.semibold) + Text(": \(avoidanceCount)")
                    Text("Attention").fontWeight(.semibold) + Text(": \(attentionCount)")
                    Text("Sensory").fontWeight(.semibold) + Text(": \(sensoryCount)")
                    Text("Combination").fontWeight(.semibold) + Text(": \(combinationCount)")
                }
                Section {
                    Text("What patterns are you able to notice? Start thinking of how to replace problematic behaviors with (teach, practice, and reinforce) more productive and appropriate ones.")
                }
            }
                .navigationTitle("A summary so far")
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(aBCDataCopy: BehaviorData())
    }
}
