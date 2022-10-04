//
//  SettingsView.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 12.05.2022.
//

import SwiftUI
import Combine

struct SettingsView: View {
    let cities = ["St. Petersburg", "Helsinki", "Stockholm", "Los Angeles"]
    @ObservedObject var settingsStore: SettingsStore
    
    var body: some View {
        Form {
            Section(header: Text("Location")) {
                Picker(selection: $settingsStore.city, label: Text("City")) {
                    ForEach(0..<cities.count) {
                        Text(self.cities[$0]).tag(self.cities[$0])
                    }
                }
            }
        }.navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settingsStore: SettingsStore())
    }
}
