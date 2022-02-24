//
//  ContentView.swift
//  ABAid
//
//  Created by Greg Wu on 12/14/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var aBCData = BehaviorData()
    
    var body: some View {
        TabView {
            HomeView(aBCDataCopy: aBCData)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            DataEntryView(aBCDataCopy: aBCData)
                .tabItem {
                    Image(systemName: "plus.square.on.square")
                    Text("Enter Data")
                }
            ListView(aBCDataCopy: aBCData)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
            SummaryView(aBCDataCopy: aBCData)
                .tabItem {
                    Image(systemName: "chart.bar.doc.horizontal")
                    Text("Summary")
                }
            FirstAidView()
                .tabItem {
                    Image(systemName: "cross.case")
                    Text("First Aid")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
