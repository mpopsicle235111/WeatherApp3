//
//  WeatherCard.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 12.05.2022.
//

import SwiftUI

struct WeatherCard: View {
    var weather: Weather
    
    var body: some View {
        VStack {
            HStack {
                Image(weather.weatherState).resizable().frame(width: 50, height: 50)
                Text(UserDefaults.city).font(.title)
            }
            
            Spacer().frame(height: 25)
            
            Text("\(weather.theTemp)º")
                .font(.system(size: 60))
                .accessibility(identifier: "weather")
            
            Spacer().frame(height: 25)
            
            HStack {
                VStack {
                    Text("Minimal")
                    Text("\(weather.minTemp)º")
                }
                Divider().frame(height: 50).padding()
                VStack {
                    Text("Maximal")
                    Text("\(weather.maxTemp)º")
                }
                Divider().frame(height: 50).padding()
                VStack {
                    Text("Humidity")
                    Text("\(weather.humidity)%")
                }
                
            }.frame(height: 10)
            
        }
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(weather: Weather.getDefault())
    }
}
