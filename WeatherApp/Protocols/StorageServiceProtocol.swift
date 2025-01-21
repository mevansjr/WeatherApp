//
//  StorageServiceProtocol.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Combine
import Foundation

/// Protocol defining the methods for saving and retrieving a user's saved location.
///
/// This protocol is intended to abstract the storage operations related to a saved location, allowing for flexibility in implementing different storage solutions, such as `UserDefaults`, a local database, or remote storage.

protocol StorageServiceProtocol {
    
    /// Saves a city name as the user's location.
    ///
    /// - Parameter cityName: The name of the city to be saved.
    func saveLocation(_ cityName: String)
    
    /// Retrieves the saved city name from storage.
    ///
    /// - Returns: A string representing the saved city name, or `nil` if no city is saved.
    func getSavedLocation() -> String?
}
