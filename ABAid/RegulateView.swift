//
//  RegulateView.swift
//  ABAid
//
//  Created by Greg Wu on 5/16/22.
//

import SwiftUI

struct RegulateView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    Text("\nRegulate").fontWeight(.bold).font(.title) +
                    Text(" - Support your kiddo, and yourself, in calming down (achieving emotional regulation) from any upset or tantrum. Be patient and wait it out as necessary!")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\nClear area of safety hazards, obstacles, or personal contact\n\nStep back and take a break for yourself as needed\n\nHelp your kiddo take deep breaths and count\n\nHelp your kiddo squeeze hands or use other pressure\n\nMove to a quieter, less busy location")
                    Spacer()
                }
            }
                .font(.title3)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct RegulateView_Previews: PreviewProvider {
    static var previews: some View {
        RegulateView()
    }
}
