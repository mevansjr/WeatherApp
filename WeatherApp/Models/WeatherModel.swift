//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Foundation

struct WeatherModel: Equatable, Identifiable {
    let id = UUID()
    let cityName: String
    let temperature: Int
    let conditionIconName: String
    let humidity: Int
    let uvIndex: Int
    let feelsLikeTemperature: Int
}
