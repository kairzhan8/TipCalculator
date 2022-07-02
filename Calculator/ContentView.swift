//
//  ContentView.swift
//  Calculator
//
//  Created by Kaiyrzhan Kural on 02.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    private var tips = [0, 5, 10 ,15, 20]
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tips[tipPercentage])
        let orderAmount = Double(amount) ?? 0
        let tipAmount = orderAmount / 100 * tipSelection
        let total = orderAmount +  tipAmount
        return total / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much tips want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tips.count, id: \.self) {
                            Text("\(tips[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("Tips calculator")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
