//
//  FirstAidView.swift
//  ABAid
//
//  Created by Greg Wu on 12/14/21.
//

import SwiftUI

struct FirstAidView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: true) {
                    Text("Got a challenging situation at hand? Here are some suggestions, though be sure to consult with your provider to determine what's best in your situation!")
                        .font(.title3)
                        .foregroundColor(.init(white: 0.20))
                    NavigationLink(destination: WaitView()) {
                        Text("\n\(Image(systemName: "1.circle")) Wait  \(Image(systemName: "chevron.forward"))\n")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.init(white: 0.35))
                    }
                    NavigationLink(destination: ValidateView()) {
                        Text("\(Image(systemName: "2.circle")) Validate  \(Image(systemName: "chevron.forward"))\n")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.init(white: 0.35))
                    }
                    NavigationLink(destination: RegulateView()) {
                        Text("\(Image(systemName: "3.circle")) Regulate  \(Image(systemName: "chevron.forward"))\n")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.init(white: 0.35))
                    }
                    NavigationLink(destination: CommunicateView()) {
                        Text("\(Image(systemName: "4.circle")) Communicate  \(Image(systemName: "chevron.forward"))\n")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.init(white: 0.35))
                    }
                    NavigationLink(destination: FacilitateView()) {
                        Text("\(Image(systemName: "5.circle")) Facilitate  \(Image(systemName: "chevron.forward"))\n")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.init(white: 0.35))
                    }
                    NavigationLink(destination: MotivateView()) {
                        Text("\(Image(systemName: "6.circle")) Motivate  \(Image(systemName: "chevron.forward"))")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.init(white: 0.35))
                    }
                }
                    .padding()
            }
                .navigationTitle("First Aid")
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FirstAidView_Previews: PreviewProvider {
    static var previews: some View {
        FirstAidView()
    }
}
