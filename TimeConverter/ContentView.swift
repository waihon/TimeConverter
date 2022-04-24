//
//  ContentView.swift
//  TimeConverter
//
//  Created by Waihon Yew on 23/04/2022.
//

import SwiftUI

struct ContentView: View {
    // The value represents the number of seconds (base unit) for each unit.
    static let units = [
        "Seconds": 1.0,
        "Minutes": 60.0,
        "Hours": 3_600.0,
        "Days": 86_400
    ]
    static let baseUnit = "Seconds"

    @State private var inputUnit = baseUnit
    @State private var outputUnit = baseUnit
    @State private var inputQuantity = 1.0

    var outputQuantity: Double {
        let inputInBaseUnit = Self.units[inputUnit]!
        let outputInBaseUnit = Self.units[outputUnit]!
        return inputQuantity * inputInBaseUnit / outputInBaseUnit
    }

    var body: some View {
        Form {
            Section {
                TextField("Input Quantity", value: $inputQuantity, format: .number)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Input Quantity")
            }

            Section {
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(Self.units.sorted(by: >), id: \.key) { key, value in
                        Text("\(key)")
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Input Unit")
            }

            Section {
                Text("\(outputQuantity.formatted())")
            } header: {
                Text("Output Quantity")
            }

            Section {
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(Self.units.sorted(by: >), id: \.key) { key, value in
                        Text("\(key)")
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Output Unit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
