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
    @State private var showDuplicateEventAlert = false

    let functions = ["Unsure", "Access", "Avoidance", "Attention", "Sensory", "Combination"]
    let functionDescriptions = ["Don't know yet.", "\"I want something that may not be available, or need help.\"", "\"I don’t want to do something asked of me, or that I’m supposed to be doing.\"", "\"I want someone to pay attention to me.\"", "\"I need to meet my sensory needs or cravings.\"", "\"I have a mix of needs.\""]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Spacer()
                        Button("Duplicate this Event") {
                            duplicateEvent()
                        }
                        Spacer()
                    }
                }
                Section {
                    Text("Behavior").fontWeight(.semibold) + Text(": ") + Text("\(aBCDataCopy.events[eventIndex].behavior)")
                    TextField("Behavior", text: $behavior, prompt: Text("Enter new description"))
                    HStack {
                        Spacer()
                        Button("Copy Current Description") {
                            behavior = self.aBCDataCopy.events[eventIndex].behavior
                        }
                        Spacer()
                    }
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
                        Button("Copy Current Description") {
                            antecedent = self.aBCDataCopy.events[eventIndex].antecedent
                        }
                        Spacer()
                    }
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
                        Button("Copy Current Description") {
                            consequence = self.aBCDataCopy.events[eventIndex].consequence
                        }
                        Spacer()
                    }
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
                            self.aBCDataCopy.events.sort {
                                $0.when < $1.when
                            }
                            self.dismiss()
                        }
                    }
                }
                .alert("Event has been duplicated", isPresented: $showDuplicateEventAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("Find the event in List and edit date, time, or other needed details.")
                }
        }
    }
    
    func duplicateEvent() {
        let event = Event(when: aBCDataCopy.events[eventIndex].when, antecedent: aBCDataCopy.events[eventIndex].antecedent, behavior: aBCDataCopy.events[eventIndex].behavior, consequence: aBCDataCopy.events[eventIndex].consequence, functionSelection: aBCDataCopy.events[eventIndex].functionSelection)
        aBCDataCopy.events.append(event)
        showDuplicateEventAlert = true
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
