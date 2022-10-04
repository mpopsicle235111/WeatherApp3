//
//  ContentViewModel.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 11.05.2022.
//

import Foundation
import Combine

/// The state which we shall initialize at the scene
class ContentViewModel: ObservableObject {
    
    //This is where we watch for the city to change
    let willChange = PassthroughSubject<Void, Never>()
    private var weatherService: WeatherService = WeatherService()
    
    //Published is a structure/type that publishes a property marked with an attribute
    //These are the properties that we can feed to some new value and trace them further
    //The property is marked to show that it will be set
    @Published var isVisible: Bool = false
    
    /// A State that contains the current data from the server
    //WeatherList generates a "send" event for subscribers to willChange
    var weatherList: [Weather] = [Weather]() {
        willSet {
            willChange.send()
        }
    }
    
    func getWeather() {
        let code = self.getLocationCode(city: UserDefaults.city)
        let params = ["location": code]
        
        weatherService.getWeatherAPI(
            parameters: params,
            onSuccess: {(response) in
                self.weatherList = response
                print("Response \(response)")
                self.isVisible = true
            },
            onFailure: {(message) in
                print("message \(message)")
            })
    }
    
    private func getLocationCode(city: String) -> String {
        switch city {
        case "St. Petersburg":
            return "2123260"
        case "Helsinki":
            return "565346"
        case "Stockholm":
            return "906057"
        case "Los Angeles":
            return "2442047"
        default:
            return "2123260"
        }
    }
}
