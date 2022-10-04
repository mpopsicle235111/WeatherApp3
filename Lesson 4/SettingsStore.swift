//
//  SettingsStore.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 12.05.2022.
//

import Foundation
import Combine

class SettingsStore: ObservableObject {
    
    let willChange = PassthroughSubject<Void, Never>()
    
    //We subscribe to the STATE "willChange" and watch for the city to change
    var city: String = UserDefaults.city {
        willSet {
            //Then the settings are saved to UserDefaults
            UserDefaults.city = newValue
            willChange.send()
        }
    }
}

extension UserDefaults {
    private struct Keys {
        static let city = "City"
    }
    
    static var city: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.city) ?? "St. Petersburg"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.city)
        }
    }
}
