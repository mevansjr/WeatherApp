//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Combine
import Foundation

/// A service for fetching weather data from the Weather API.
///
/// This class is responsible for making network requests to fetch weather data for a given city.
/// It adheres to the `WeatherServiceProtocol`, ensuring modularity and testability.
///
/// # Features
/// - Constructs API requests using a base URL and API key.
/// - Decodes the API response into a `WeatherModel`.
/// - Handles errors such as invalid URLs or decoding failures.
class WeatherService: WeatherServiceProtocol {
    // MARK: - Properties

    /// The API key required for authentication.
    private let apiKey: String
    
    /// The base URL for the Weather API.
    private let baseURL: String
    
    /// The URLSession instance used for network requests.
    private let session: URLSession

    // MARK: - Initialization

    /// Initializes the `WeatherService` with default configurations.
    ///
    /// The API key and base URL are sourced from the `API` struct, and a shared `URLSession` instance is used.
    init() {
        self.apiKey = API.apiKey
        self.baseURL = API.baseURL
        self.session = URLSession.shared
    }

    // MARK: - Public Methods

    /// Fetches weather data for a specified city.
    ///
    /// - Parameter city: The name of the city for which to fetch weather data.
    /// - Returns: A publisher that emits a `WeatherModel` on success or an `Error` on failure.
    func fetchWeather(for city: String) -> AnyPublisher<WeatherModel, Error> {
        guard let url = buildURL(for: city) else {
            return Fail(error: WeatherServiceError.invalidURL)
                .eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: url)
            .map(\.data) // Extract the data from the response.
            .decode(type: WeatherAPIResponse.self, decoder: JSONDecoder()) // Decode the JSON response.
            .tryMap { try WeatherMapper.map(response: $0) } // Map the API response to a `WeatherModel`.
            .receive(on: DispatchQueue.main) // Deliver results on the main thread.
            .eraseToAnyPublisher()
    }

    // MARK: - Private Methods

    /// Constructs the URL for the weather API request.
    ///
    /// - Parameter city: The name of the city for which to construct the URL.
    /// - Returns: A URL if the components are valid, otherwise `nil`.
    private func buildURL(for city: String) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: API.QueryItem.key, value: apiKey),
            URLQueryItem(name: API.QueryItem.q, value: city)
        ]
        return components?.url
    }
}
