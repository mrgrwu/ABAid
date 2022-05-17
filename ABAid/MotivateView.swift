//
//  MotivateView.swift
//  ABAid
//
//  Created by Greg Wu on 5/16/22.
//

import SwiftUI

struct MotivateView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    Text("\nMotivate").fontWeight(.bold).font(.title) +
                    Text(" - Enthusiastically reinforce each successful behavior or action! Plan for next time using a preventative (antecedent) strategy:")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\nPriming with social stories, schedules, timer, or visual cues\n\nRole playing with emotional referencing and problem solving\n\nFirst/Then charts\n\nI Am Working For or other goal tracking charts")
                    Spacer()
                }
            }
                .font(.title3)
                .padding()
        }
    }
}

struct MotivateView_Previews: PreviewProvider {
    static var previews: some View {
        MotivateView()
    }
}
