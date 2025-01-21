//
//  WeatherSearchView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A view that displays weather information for a searched city.
///
/// This view is designed to show key weather details, such as the city name, temperature, and condition icon, in a compact and visually appealing layout.
///
/// # Example Usage
/// ```
/// WeatherSearchView(weather: WeatherModel(cityName: "New York",
///                                         temperature: 25,
///                                         conditionIconName: "https://example.com/icon.png",
///                                         humidity: 60,
///                                         uvIndex: 5,
///                                         feelsLikeTemperature: 27))
/// ```
struct WeatherSearchView: View {
    // MARK: - Properties

    /// The `WeatherModel` containing weather details for a specific city.
    let weather: WeatherModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 16) {
            Spacer().frame(width: 4)

            // Weather Details: City name and temperature.
            VStack(alignment: .leading, spacing: 8) {
                // City Name
                Text(weather.cityName)
                    .font(.custom(FontConstants.mediumFont, size: FontConstants.mediumFontSize))

                // Temperature
                TemperatureView(temperature: weather.temperature, fontSize: FontConstants.xLargeFontSize)
            }

            Spacer()

            // Weather Icon
            CachedAsyncImage(url: URL(string: weather.conditionIconName))
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)

            Spacer().frame(width: 4)
        }
        .padding()
        .background(ColorConstants.lighterGray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(height: 117)
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
        .onTapGesture {
            hideKeyboard()
        }
    }
}
