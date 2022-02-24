//
//  HomeView.swift
//  ABAid
//
//  Created by Greg Wu on 12/16/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var aBCDataCopy: BehaviorData
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("ABAid")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Welcome to ABAid. To get started, let's collect some ABC data using the Enter Data tab. You've got this!")
                .font(.title3)
            Button("Share Data") {
                
            }
                .font(.title3)
            Button("Erase Data") {
                showAlert = true
            }
                .font(.title3)
        }
            .padding()
            .alert("Erase all data?", isPresented: $showAlert) {
                Button("Erase", role: .destructive) {
                    aBCDataCopy.events = []
                }
                Button("Cancel", role: .cancel) {}
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(aBCDataCopy: BehaviorData())
    }
}
