//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Combine
import Foundation

/// ViewModel responsible for managing the weather data, user interactions, and communication between the WeatherView and services.
///
/// This ViewModel handles:
/// - Fetching weather data from a WeatherService.
/// - Managing user search input and observing its changes.
/// - Persisting and loading the user's last searched location using a StorageService.
/// - Handling loading states and error messages.
class WeatherViewModel: ObservableObject {
    // MARK: - Published Properties

    /// The text input by the user in the search bar.
    @Published var searchText: String = ""

    /// The current weather data fetched from the service.
    @Published var weather: WeatherModel?

    /// Indicates whether the app is currently loading data.
    @Published var isLoading: Bool = false

    /// An error message to display if data fetching fails.
    @Published var errorMessage: String?

    // MARK: - Private Properties

    /// The service responsible for fetching weather data.
    private let weatherService: WeatherServiceProtocol

    /// The service responsible for persisting and retrieving data.
    private let storageService: StorageServiceProtocol

    /// A set of Combine cancellables to manage subscriptions.
    private var cancellables = Set<AnyCancellable>()

    /// The minimum number of characters required to trigger a search.
    private let minSearchCharacters = 3

    // MARK: - Initializer

    /// Initializes the WeatherViewModel with the required services.
    ///
    /// - Parameters:
    ///   - weatherService: A service conforming to `WeatherServiceProtocol` for fetching weather data.
    ///   - storageService: A service conforming to `StorageServiceProtocol` for managing persistent data.
    init(weatherService: WeatherServiceProtocol, storageService: StorageServiceProtocol) {
        self.weatherService = weatherService
        self.storageService = storageService
        loadSavedLocation()
        observeSearchText()
    }

    // MARK: - Public Methods

    /// Fetches weather data for a given query.
    ///
    /// - Parameter query: The city name or query string for fetching weather data.
    /// - Note: Only triggers a fetch if the query is at least `minSearchCharacters` long.
    func fetchWeatherForQuery(_ query: String) {
        guard query.count >= minSearchCharacters else { return }

        isLoading = true
        weatherService.fetchWeather(for: query)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                    self?.weather = nil
                }
            }, receiveValue: { [weak self] weather in
                self?.weather = weather
                self?.errorMessage = nil
                self?.saveLocation(weather.cityName)
            })
            .store(in: &cancellables)
    }

    // MARK: - Private Methods

    /// Saves the last successfully searched city name to persistent storage.
    ///
    /// - Parameter cityName: The name of the city to save.
    private func saveLocation(_ cityName: String) {
        storageService.saveLocation(cityName)
    }

    /// Loads the last saved city name from persistent storage and fetches its weather data.
    private func loadSavedLocation() {
        if let savedCity = storageService.getSavedLocation() {
            fetchWeatherForQuery(savedCity)
        }
    }

    /// Observes changes to the `searchText` property and debounces updates.
    /// Automatically triggers a fetch when the text changes, after a delay of 300 milliseconds.
    private func observeSearchText() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.fetchWeatherForQuery(query)
            }
            .store(in: &cancellables)
    }
}
