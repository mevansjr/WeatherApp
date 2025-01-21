//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A view displaying weather information, allowing users to search for a city and view weather details.
/// The view handles different states such as loading, displaying weather, showing an error, or being empty.
struct WeatherView: View {
    @StateObject private var viewModel: WeatherViewModel

    /// Initializes the `WeatherView` with required services.
    /// - Parameters:
    ///   - weatherService: A protocol to fetch weather data.
    ///   - storageService: A protocol to manage persistent data storage.
    init(weatherService: WeatherServiceProtocol, storageService: StorageServiceProtocol) {
        _viewModel = StateObject(
            wrappedValue: WeatherViewModel(
                weatherService: weatherService,
                storageService: storageService
            )
        )
    }

    var body: some View {
        VStack {
            // Search bar to input city name and trigger weather fetching.
            SearchBarView(text: $viewModel.searchText) { query in
                viewModel.fetchWeatherForQuery(query)
            }
            .accessibilityLabel("Search for a city")
            .accessibilityHint("Type the name of a city to fetch its weather.")

            // Main content area handling different states.
            Group {
                if viewModel.isLoading {
                    LoadingView()
                        .accessibilityLabel("Loading weather data")
                } else if let weather = viewModel.weather {
                    if viewModel.searchText.isEmpty {
                        WeatherDetailsView(weather: weather)
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel("Weather details for \(weather.cityName)")
                    } else {
                        WeatherSearchView(weather: weather)
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel("Search results showing weather details for \(weather.cityName)")
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    ErrorView(errorMessage: errorMessage)
                        .padding(.vertical, 44)
                        .accessibilityLabel("Error: \(errorMessage)")
                        .accessibilityHint("Try searching for another city.")
                } else {
                    EmptyLocationView()
                        .padding(.vertical, 44)
                        .accessibilityLabel("No city selected")
                        .accessibilityHint("Please search for a city to display weather details.")
                }
            }
            .transition(.opacity)
            .animation(.easeInOut, value: viewModel.weather)

            Spacer() // Pushes content up to avoid cramped layout.
        }
        .padding()
        .onTapGesture {
            hideKeyboard()
        }
        .accessibilityElement(children: .contain) // Groups all elements in this view for better navigation.
    }
}
