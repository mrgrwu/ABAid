//
//  FacilitateView.swift
//  ABAid
//
//  Created by Greg Wu on 5/16/22.
//

import SwiftUI

struct FacilitateView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    Text("\nFacilitate").fontWeight(.bold).font(.title) +
                    Text(" - Prompt and model the desired or more appropriate behavior or action. Provide only as much guidance as needed (be least intrusive):")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("\nPoint or gesture in lieu of words\n\n\"You can say ___ or do ___ (instead)\"\n\nFollow through with choices (if available): \"We need to do ___, but you can choose ___.  You can ___, or I can help\"")
                    Spacer()
                }
            }
                .font(.title3)
                .padding()
        }
    }
}

struct FacilitateView_Previews: PreviewProvider {
    static var previews: some View {
        FacilitateView()
    }
}
