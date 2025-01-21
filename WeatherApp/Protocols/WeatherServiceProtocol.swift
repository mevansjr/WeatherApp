//
//  WeatherServiceProtocol.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Combine
import Foundation

/// Protocol defining the method for fetching weather data.
///
/// This protocol abstracts the weather fetching functionality, enabling flexibility in implementing various services, such as API calls or mock data for testing.

protocol WeatherServiceProtocol {
    
    /// Fetches the weather data for a given city.
    ///
    /// - Parameter city: The name of the city for which weather data is requested.
    /// - Returns: An `AnyPublisher` that emits the `WeatherModel` representing the weather information, or an error if the fetch fails.
    func fetchWeather(for city: String) -> AnyPublisher<WeatherModel, Error>
}
