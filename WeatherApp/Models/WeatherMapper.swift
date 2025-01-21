//
//  WeatherMapper.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Foundation

struct WeatherMapper {
    static func map(response: WeatherAPIResponse) throws -> WeatherModel {
        return WeatherModel(
            cityName: response.location.name,
            temperature: Int(response.current.temp_f),
            conditionIconName: mapWeatherConditionToIcon(response.current.condition.icon),
            humidity: Int(response.current.humidity),
            uvIndex: Int(response.current.uv),
            feelsLikeTemperature: Int(response.current.feelslike_f)
        )
    }

    private static func mapWeatherConditionToIcon(_ iconURL: String) -> String {
        iconURL
            .replacingOccurrences(of: "//cdn", with: Constants.iconBaseURLReplacement)
            .replacingOccurrences(of: "64x64", with: Constants.iconSizeReplacement)
    }
}
