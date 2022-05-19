//
//  ActionDetailView.swift
//  ABAid
//
//  Created by Greg Wu on 5/18/22.
//

import SwiftUI

struct ActionDetailView: View {
    @ObservedObject var trackingDataCopy: TrackingData
    var eventIndex: Int
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("\(trackingDataCopy.actions[eventIndex].description)")
                    .fontWeight(.semibold)
                Text("\(trackingDataCopy.actions[eventIndex].count) count")
                    .fontWeight(.semibold)
                HStack {
                    Button("\(Image(systemName: "minus.rectangle"))") {
                        if self.trackingDataCopy.actions[eventIndex].count > 0 {
                            self.trackingDataCopy.actions[eventIndex].count -= 1
                        }
                    }
                        .font(.title)
                        .padding()
                    Spacer()
                    Button("\(Image(systemName: "plus.rectangle"))") {
                        self.trackingDataCopy.actions[eventIndex].count += 1
                    }
                        .font(.title)
                        .padding()
                }
                Spacer()
            }
                .font(.title2)
                .padding()
                .navigationTitle("Action Detail")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            self.dismiss()
                        }
                    }
                }
        }
    }
}

//struct ActionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionDetailView()
//    }
//}
