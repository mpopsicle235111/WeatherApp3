//
//  Weather.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 11.05.2022.
//

import Foundation

struct Weather: Hashable {
    
    var weatherState: String = "n/a"
    var minTemp: String = ""
    var maxTemp: String = ""
    var theTemp: String = ""
    var humidity: String = ""
    var strDate: String = ""
    
    init (json: [String: Any]) {
        if let weatherState = json["weather_state_abbr"] { self.weatherState = "\(weatherState)" }
        if let minTemp = json["min_temp"] as? Double {self.minTemp = "\(minTemp.rounded())" }
        if let maxTemp = json["max_temp"] as? Double {self.maxTemp = "\(maxTemp.rounded())" }
        if let theTemp = json["the_temp"] as? Double {self.theTemp = "\(theTemp.rounded())" }
        if let humidity = json["humidity"] as? Int {self.humidity = "\(humidity)" }
        if let strDate = json["applicable_date"] {self.strDate = "\(strDate)" }
    }
    
    static func getModels(_ json: [[String: Any]]) -> [Weather] {
        return json.map { Weather(json: $0) }
    }
    
    /// This func makes a stub JSON out of the object Weather
    static func getDefault() -> Weather {
        let data: [String: Any] = [
            "id": 6381777272700928,
            "weather_state_name": "Light Rain",
            "applicable_date": "2022-05-11",
            "min_temp": 9.055,
            "max_temp": 14.754999999999999,
            "the_temp": 13.530000000000001,
            "humidity": 87
        ]
        
        return Weather(json: data)
    }
    
    func getDate() -> String {
        let arrDate = strDate.split(separator: "-")
        return "\(arrDate[2])/\(arrDate[1])"
    }
}
