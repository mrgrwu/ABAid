//
//  ListView.swift
//  ABAid
//
//  Created by Greg Wu on 12/14/21.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var aBCDataCopy: BehaviorData
    @State private var eventIndex = 0
    @State private var showDetailView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< aBCDataCopy.events.count, id: \.self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(self.aBCDataCopy.events[index].when.formatted(date: .abbreviated, time: .shortened))")
                                .font(.headline)
                            Text("\(self.aBCDataCopy.events[index].behavior)")
                        }
                        Spacer()
                        
                        Button("\(Image(systemName: "chevron.forward.circle"))") {
                            self.eventIndex = index
                            self.showDetailView = true
                        }
                    }
                }
                    .onDelete { indexSet in
                        self.aBCDataCopy.events.remove(atOffsets: indexSet)
                    }
                    .onMove { source, destination in
                        self.aBCDataCopy.events.move(fromOffsets: source, toOffset: destination)
                    }
            }
                .navigationTitle("Your data so far")
                .toolbar {
                    EditButton()
                }
                .sheet(isPresented: $showDetailView) {
                    DetailView(aBCDataCopy: aBCDataCopy, eventIndex: eventIndex)
                }
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(aBCDataCopy: BehaviorData())
    }
}
