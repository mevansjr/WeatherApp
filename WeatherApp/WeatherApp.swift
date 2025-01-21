//
//  weather_appApp.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView(weatherService: WeatherService(), storageService: UserDefaultsStorageService())
        }
    }
}
