//
//  DataEntryView.swift
//  ABAid
//
//  Created by Greg Wu on 12/14/21.
//

import SwiftUI

struct DataEntryView: View {
    @ObservedObject var aBCDataCopy: BehaviorData
    
    @State private var when = Date()
    @State private var antecedent: String = ""
    @State private var behavior: String = ""
    @State private var consequence: String = ""
    @State private var functionSelection: Int = 0
        
    let functions = ["Unsure", "Access", "Avoidance", "Attention", "Sensory", "Combination"]
    let functionDescriptions = ["Don't know yet.", "\"I want something that may not be available, or need help.\"", "\"I don’t want to do something asked of me, or that I’m supposed to be doing.\"", "\"I want someone to pay attention to me.\"", "\"I need to meet my sensory needs or cravings.\"", "\"I have a mix of needs.\""]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Is this event very similar to something that happened before? Go to List, view the event, and select Duplicate.")
                        .font(.callout)
                }
                Section(header: Text("What happened? Who did what, or to whom?")) {
                    Text("Describe the ") + Text("behavior").fontWeight(.semibold) + Text(":")
                    TextField("Behavior", text: $behavior, prompt: Text("Describe the behavior"))
                }
                
                Section(header: Text("When did it happen?")) {
                    DatePicker("Date and Time", selection: $when, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                }
                
                Section(header: Text("What happened right before? Who was there and what was each person doing?")) {
                    Text("Describe the ") + Text("antecedent").fontWeight(.semibold) + Text(":")
                    TextField("Antecedent", text: $antecedent, prompt: Text("Describe the antecedent"))
                }
                
                Section(header: Text("What happened right after? What did each person do as a result of the behavior?")) {
                    Text("Describe the ") + Text("consequence").fontWeight(.semibold) + Text(":")
                    TextField("Consequence", text: $consequence, prompt: Text("Describe the consequence"))
                }
                
                Section(header: Text("What was the primary function? What do you think the individual was looking for?")) {
                    Text("Choose a ") + Text("function").fontWeight(.semibold) + Text(" for the behavior:")
                    Picker("", selection: $functionSelection) {
                        ForEach(0 ..< functions.count, id:\.self) {
                            Text("\(self.functions[$0])").fontWeight(.semibold) + Text(": \(self.functionDescriptions[$0])")
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        self.submitData()
                    }
                    Spacer()
                }
            }
                .navigationTitle("Let's enter ABC data")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Clear") {
                            self.clearFields()
                        }
                    }
                }
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func submitData() {
        let event = Event(when: when, antecedent: antecedent, behavior: behavior, consequence: consequence, functionSelection: functionSelection)
        aBCDataCopy.events.append(event)
        aBCDataCopy.events.sort {
            $0.when < $1.when
        }
        clearFields()
    }
    
    func clearFields() {
        when = Date()
        antecedent = ""
        behavior = ""
        consequence = ""
        functionSelection = 0
    }
}

struct DataEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DataEntryView(aBCDataCopy: BehaviorData())
            .previewInterfaceOrientation(.portrait)
    }
}
