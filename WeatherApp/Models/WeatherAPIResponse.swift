//
//  WeatherAPIResponse.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Foundation

struct WeatherAPIResponse: Decodable {
    let location: Location
    let current: CurrentWeather

    struct Location: Decodable {
        let name: String
    }

    struct CurrentWeather: Decodable {
        let temp_f: Double
        let feelslike_f: Double
        let humidity: Double
        let uv: Double
        let condition: WeatherCondition

        struct WeatherCondition: Decodable {
            let icon: String
        }
    }
}
