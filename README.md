WeatherApp
==========

A SwiftUI-based weather tracker application that allows users to search for cities, view weather information, and persist their favorite city across app launches. Built with a focus on clean architecture, this application demonstrates the use of MVVM principles and integrates data from WeatherAPI.com.

Features
--------

*   **Home Screen**:
    
    *   Displays current weather details for a saved city, including:
        
        *   City name
            
        *   Temperature
            
        *   Weather condition with corresponding icon
            
        *   Humidity (%)
            
        *   UV index
            
        *   "Feels like" temperature
            
    *   Provides a prompt to search for a city if no city is saved.
        
*   **Search Functionality**:
    
    *   Users can search for cities using a search bar.
        
    *   Displays a search result card for the queried city.
        
    *   Allows users to tap a search result to update the home screen with the new city's weather and persist the selection.
        
*   **Local Storage**:
    
    *   Utilizes UserDefaults to save the selected city.
        
    *   Automatically reloads the city’s weather when the app launches.
        

API Integration
---------------

This application uses the [WeatherAPI.com](https://www.weatherapi.com/docs/) to fetch current weather data, which includes:

*   Temperature
    
*   Weather condition (with an icon)
    
*   Humidity (%)
    
*   UV index
    
*   Feels like temperature
    

Technology Stack
----------------

*   Swift
    
*   SwiftUI
    
*   MVVM Architecture
    
*   Protocol-Oriented Programming
    
*   Dependency Injection
    

Setup Instructions
------------------

1.  Copygit clone https://github.com/mevansjr/WeatherApp.git
    
2.  Copycd WeatherApp
    
3.  Copyopen WeatherApp.xcodeproj
    
4.  Install the required dependencies (if any).
    
5.  Replace the placeholder API key in the code with your own from WeatherAPI.com.
    
6.  Run the application on a simulator or a physical device.