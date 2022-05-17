//
//  WaitView.swift
//  ABAid
//
//  Created by Greg Wu on 5/16/22.
//

import SwiftUI

struct WaitView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    Text("\nWait").fontWeight(.bold).font(.title) +
                    Text(" long enough to avoid reacting and to calmly observe what’s happening (unless safety requires otherwise). Challenging behaviors usually serve one of the following functions:")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\nI need or want (to do) something\n\nI don’t want (to do) something\n\nI want attention").italic() +
                    Text(" - In this case wait longer to avoid inadvertent reinforcement of anything inappropriate. You may skip to Communicate if your kiddo seems well regulated.\n\n") +
                    Text("I have sensory needs (seeking or avoiding)").italic()
                    Spacer()
                }
            }
                .font(.title3)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct WaitView_Previews: PreviewProvider {
    static var previews: some View {
        WaitView()
    }
}
