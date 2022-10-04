//
//  ContentView.swift
//  Lesson 4
//
//  Created by Anton Lebedev on 11.05.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentVM: ContentViewModel
    
    var body: some View {
        NavigationView {
            ZStack { //Zstack is used as a base,like any regular View
                //Color("primaryColor").edgesIgnoringSafeArea(.all)
                Color("CaribbeanBlue-CHANGE-IN-ASSETS").edgesIgnoringSafeArea(.all)
                ScrollView {
                    if $contentVM.isVisible.wrappedValue {
                        VStack {
                            WeatherCard(weather: $contentVM.weatherList.wrappedValue.removeFirst()).padding()
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach($contentVM.weatherList.wrappedValue, id: \.self) { weather in
                                        DayCard(weather: weather)
                                    }
                                }
                            }.padding()
                            
                            Spacer()
                            
                            NavigationLink(destination: SettingsView(settingsStore: SettingsStore()).onDisappear(perform: fetch)) {
                                Text("Change City")
                                Image(systemName: "gear")
                            }.padding()
                            
                            Spacer()
                        }
                    }
                }
            }
        }.onAppear(perform: fetch) //When Zstack View appears, it triggers action. GetWeather is this trigger that renews the WeatherList.
    }
    
    private func fetch() {
        contentVM.getWeather()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentVM: ContentViewModel())
    }
}
