//
//  DayCard.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 12.05.2022.
//

import SwiftUI

struct DayCard: View {
    @State var weather: Weather
    
    var body: some View {
        VStack {
            Text(weather.getDate())
            Image(weather.weatherState).resizable().frame(width: 50, height: 50)
            Text("\(weather.minTemp)º/\(weather.maxTemp)º")
        }
        .padding(20)
        //.background(Rectangle().foregroundColor(Color("cardColor")))
        .background(Rectangle().foregroundColor(Color.yellow.opacity(0.5)))
        .cornerRadius(10)
    }
}

struct DayCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(weather: Weather.getDefault())
    }
}
