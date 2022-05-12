//
//  DetailView.swift
//  ABAid
//
//  Created by Greg Wu on 12/14/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var aBCDataCopy: BehaviorData
    var eventIndex: Int
    
    @Environment(\.dismiss) var dismiss
    
    @State private var when = Date()
    @State private var antecedent: String = ""
    @State private var behavior: String = ""
    @State private var consequence: String = ""
    @State private var functionSelection: Int = 0

    let functions = ["Access", "Avoidance", "Attention", "Sensory", "Combination"]
    let functionDescriptions = ["I want something that may not be available, or need help.", "I don’t want to do something asked of me, or that I’m supposed to be doing.", "I want someone to pay attention to me.", "I need to meet my sensory needs or cravings.", "I have a mix of needs."]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Behavior").fontWeight(.semibold) + Text(": ") + Text("\(aBCDataCopy.events[eventIndex].behavior)")
                    TextField("Behavior", text: $behavior, prompt: Text("Enter new description"))
                    HStack {
                        Spacer()
                        Button("Update") {
                            self.aBCDataCopy.events[eventIndex].behavior = behavior
                        }
                        Spacer()
                    }
                }
                
                Section {
                    Text("When").fontWeight(.semibold) + Text(": ") + Text("\(aBCDataCopy.events[eventIndex].when.formatted(date: .abbreviated, time: .shortened))")
                    DatePicker("Date and Time", selection: $when, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                    HStack {
                        Spacer()
                        Button("Update") {
                            self.aBCDataCopy.events[eventIndex].when = when
                        }
                        Spacer()
                    }
                }
                
                Section {
                    Text("Antecedent").fontWeight(.semibold) + Text(": ") + Text("\(aBCDataCopy.events[eventIndex].antecedent)")
                    TextField("Antecedent", text: $antecedent, prompt: Text("Enter new description"))
                    HStack {
                        Spacer()
                        Button("Update") {
                            self.aBCDataCopy.events[eventIndex].antecedent = antecedent
                        }
                        Spacer()
                    }
                }
                
                Section {
                    Text("Consequence").fontWeight(.semibold) + Text(": ") + Text("\(aBCDataCopy.events[eventIndex].consequence)")
                    TextField("Consequence", text: $consequence, prompt: Text("Enter new description"))
                    HStack {
                        Spacer()
                        Button("Update") {
                            self.aBCDataCopy.events[eventIndex].consequence = consequence
                        }
                        Spacer()
                    }
                }
                
                Section {
                    Text("Function").fontWeight(.semibold) + Text(": ") + Text("\(functions[aBCDataCopy.events[eventIndex].functionSelection]): \(functionDescriptions[aBCDataCopy.events[eventIndex].functionSelection])")
                    Picker("", selection: $functionSelection) {
                        ForEach(0 ..< functions.count, id:\.self) {
                            Text("\(self.functions[$0])").fontWeight(.semibold) + Text(": \(self.functionDescriptions[$0])")
                        }
                    }
                    HStack {
                        Spacer()
                        Button("Update") {
                            self.aBCDataCopy.events[eventIndex].functionSelection = functionSelection
                        }
                        Spacer()
                    }
                }
            }
                .navigationTitle("View and edit event")
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

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
