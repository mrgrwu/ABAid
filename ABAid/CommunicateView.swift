//
//  CommunicateView.swift
//  ABAid
//
//  Created by Greg Wu on 5/16/22.
//

import SwiftUI

struct CommunicateView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    Text("\nCommunicate").fontWeight(.bold).font(.title) +
                    Text(" - Begin positive exchanges of communication. You can prompt with:")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\n\"Can you use your words to tell me what happened or what you need?\"\n\n\"Let’s try again\"\n\n\"Let’s try being more polite/calm/gentle\"\n\n\"I see you want ___, but we/you also need to ___\"")
                    Spacer()
                }
            }
                .font(.title3)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct CommunicateView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicateView()
    }
}
