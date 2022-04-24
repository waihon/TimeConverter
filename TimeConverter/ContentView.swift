//
//  ContentView.swift
//  TimeConverter
//
//  Created by Waihon Yew on 23/04/2022.
//

import SwiftUI

struct ContentView: View {
    static let units = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var inputUnit = units[0]
    @State private var outputUnit = units[0]
    @State private var convertFrom = 1.0

    var convertedTo: Double {
        convertFrom
    }

    var body: some View {
        Form {
            Section {
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(Self.units, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Input Unit")
            }

            Section {
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(Self.units, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Output Unit")
            }

            Section {
                TextField("Convert From", value: $convertFrom, format: .number)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Convert From")
            }

            Section {
                Text("\(convertedTo.formatted())")
            } header: {
                Text("Converted To")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
