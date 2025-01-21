//
//  UserDefaultsStorageService.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Foundation

/// A service for storing and retrieving data using `UserDefaults`.
///
/// This class implements the `StorageServiceProtocol` to provide persistent storage for the user's last searched location (city name).
/// It uses `UserDefaults` to store and retrieve the city name between app sessions.
///
/// # Features
/// - Stores the city name as a string in `UserDefaults`.
/// - Retrieves the saved city name when needed.
class UserDefaultsStorageService: StorageServiceProtocol {

    // MARK: - Public Methods

    /// Saves the provided city name to `UserDefaults`.
    ///
    /// - Parameter cityName: The name of the city to save.
    func saveLocation(_ cityName: String) {
        UserDefaults.standard.setValue(cityName, forKey: Constants.savedLocationKey)
    }

    /// Retrieves the saved city name from `UserDefaults`.
    ///
    /// - Returns: The name of the saved city, or `nil` if no city is saved.
    func getSavedLocation() -> String? {
        UserDefaults.standard.string(forKey: Constants.savedLocationKey)
    }
}
