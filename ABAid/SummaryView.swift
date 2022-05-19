//
//  SummaryView.swift
//  ABAid
//
//  Created by Greg Wu on 12/14/21.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var aBCDataCopy: BehaviorData
    @ObservedObject var trackingDataCopy: TrackingData
    @State private var actionDescription: String = ""
    @State private var actionIndex: Int = 0
    @State private var showActionDetailView = false
    
    var accessCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 1 {
                count += 1
            }
        }
        return count
    }
    var avoidanceCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 2 {
                count += 1
            }
        }
        return count
    }
    var attentionCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 3 {
                count += 1
            }
        }
        return count
    }
    var sensoryCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 4 {
                count += 1
            }
        }
        return count
    }
    var combinationCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 5 {
                count += 1
            }
        }
        return count
    }
    var unsureCount: Int {
        var count = 0
        for event in aBCDataCopy.events {
            if event.functionSelection == 0 {
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
                    Text("Unsure").fontWeight(.semibold) + Text(": \(unsureCount)")
                }
                
                Section {  // Action Tracker
                    HStack {
                        Spacer()
                        Text("Other actions to track?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    HStack {
                        TextField("Action", text: $actionDescription, prompt: Text("Enter action"))
                        Spacer()
                        Button("Submit") {
                            if actionDescription != "" {
                                addAction()
                            }
                        }
                    }
                    List {
                        ForEach(0 ..< trackingDataCopy.actions.count, id:\.self) { index in
                            HStack {
                                Text("\(trackingDataCopy.actions[index].description)")
                                Spacer()
                                Text("\(trackingDataCopy.actions[index].count)")
                                Button("\(Image(systemName: "chevron.forward.circle"))") {
                                    self.actionIndex = index
                                    self.showActionDetailView = true
                                }
                            }
                        }
                            .onDelete { indexSet in
                                self.trackingDataCopy.actions.remove(atOffsets: indexSet)
                            }
                    }
                }
                Section {
                    Text("What patterns are you able to notice? Start thinking of how to replace problematic behaviors with (teach, practice, and reinforce) more productive and appropriate ones.")
                        .font(.callout)
                }
            }
                .navigationTitle("A summary so far")
                .sheet(isPresented: $showActionDetailView) {
                    ActionDetailView(trackingDataCopy: trackingDataCopy, eventIndex: actionIndex)
                }
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func addAction() {
        let action = Action(description: actionDescription)
        trackingDataCopy.actions.append(action)
        actionDescription = ""
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(aBCDataCopy: BehaviorData(), trackingDataCopy: TrackingData())
    }
}
