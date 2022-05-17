//
//  ValidateView.swift
//  ABAid
//
//  Created by Greg Wu on 5/16/22.
//

import SwiftUI

struct ValidateView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    Text("\nValidate").fontWeight(.bold).font(.title) +
                    Text(" or recognize the emotions you observe in your kiddo, and yourself! Aim to be present, yet objective:")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\n\"I can see you’re (feeling) frustrated/angry/sad/excited\"\n\n\"I see you (really) want …\"")
                    Spacer()
                }
            }
                .font(.title3)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct ValidateView_Previews: PreviewProvider {
    static var previews: some View {
        ValidateView()
    }
}
