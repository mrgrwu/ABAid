//
//  HomeView.swift
//  ABAid
//
//  Created by Greg Wu on 12/16/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var aBCDataCopy: BehaviorData
    @ObservedObject var trackingDataCopy: TrackingData
    @State private var showExportAlert = false
    @State private var showEraseAlert = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.teal, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 25) {
                Spacer()
                Text("ABAid")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text("Need some aid in your ABA? Get started by collecting ABC data using the Enter Data tab. Need a simple tracker? Find one in the Summary tab. You've got this!")
                    .font(.title3)
                    .foregroundColor(.black)
                HStack {
                    Button(action: exportData) {
                        Text("Export Data")
                    }
                        .font(.title3)
                        .padding()
                    Spacer()
                    Button("Erase Data") {
                        showEraseAlert = true
                    }
                        .font(.title3)
                        .padding()
                }
                Spacer()
                Link(destination: URL(string: "https://bortle4tech.wordpress.com/privacy-policy/")!) {
                    Text("App Support and Privacy Policy")
                        .underline()
                        .font(.footnote)
                }
            }
                .padding()
                .alert("Data has been saved to Files", isPresented: $showExportAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("You can find a file named abcdata.csv in the ABAid folder in your Files app and share it with your provider.")
                }
                .alert("Erase all data?", isPresented: $showEraseAlert) {
                    Button("Erase", role: .destructive) {
                        aBCDataCopy.events = []
                        trackingDataCopy.actions = []
                    }
                    Button("Cancel", role: .cancel) {}
                }
        }
    }
    
    func exportData() {
        var exportString = "Date and Time,Antecedent,Behavior,Consequence,Function\n"
        let functions = ["Unsure", "Access", "Avoidance", "Attention", "Sensory", "Combination"]
        
        for eventIndex in 0 ..< aBCDataCopy.events.count {
            exportString.append("\"" + aBCDataCopy.events[eventIndex].when.formatted(date: .abbreviated, time: .shortened) + "\",")
            exportString.append(aBCDataCopy.events[eventIndex].antecedent + ",")
            exportString.append(aBCDataCopy.events[eventIndex].behavior + ",")
            exportString.append(aBCDataCopy.events[eventIndex].consequence + ",")
            exportString.append(functions[aBCDataCopy.events[eventIndex].functionSelection] + "\n")
        }
        exportString.append("Action,Count\n")
        for actionIndex in 0 ..< trackingDataCopy.actions.count {
            exportString.append(trackingDataCopy.actions[actionIndex].description + ",")
            exportString.append(String(trackingDataCopy.actions[actionIndex].count) + "\n")
        }
        
        let url = getDocumentsDirectory().appendingPathComponent("abcdata.csv")
        do {
            try exportString.write(to: url, atomically: true, encoding: .utf8)
            showExportAlert = true
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(aBCDataCopy: BehaviorData(), trackingDataCopy: TrackingData())
    }
}
