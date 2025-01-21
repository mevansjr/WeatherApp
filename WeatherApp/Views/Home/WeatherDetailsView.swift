//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A view that provides detailed weather information for a selected city.
///
/// This view displays a comprehensive set of weather details, including an icon for the current condition, temperature, humidity, UV index, and "feels like" temperature.
///
/// # Example Usage
/// ```
/// WeatherDetailsView(weather: WeatherModel(cityName: "San Francisco",
///                                          temperature: 18,
///                                          conditionIconName: "https://example.com/icon.png",
///                                          humidity: 70,
///                                          uvIndex: 3,
///                                          feelsLikeTemperature: 16))
/// ```
struct WeatherDetailsView: View {
    // MARK: - Properties

    /// The `WeatherModel` containing detailed weather information for a specific city.
    let weather: WeatherModel

    // MARK: - Body

    var body: some View {
        VStack(spacing: 8) {
            // Weather Icon
            CachedAsyncImage(url: URL(string: weather.conditionIconName))
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)

            // City Name with Location Icon
            HStack(spacing: 4) {
                Text(weather.cityName)
                    .font(.custom(FontConstants.mediumFont, size: FontConstants.largeFontSize))
                ImageConstants.locationIcon
                    .frame(height: 21)
            }

            // Temperature Display
            HStack(alignment: .top, spacing: 4) {
                Text("\(weather.temperature)")
                    .font(.custom(FontConstants.mediumFont, size: FontConstants.xLargeFontSize))
                Text(Constants.degree)
                    .font(.custom(FontConstants.mediumFont, size: FontConstants.largeFontSize))
            }

            // Weather Statistics (Humidity, UV Index, Feels Like Temperature)
            HStack {
                Spacer()
                WeatherStatView(title: Constants.humidityTitle, value: "\(weather.humidity)%")
                Spacer()
                WeatherStatView(title: Constants.uvTitle, value: "\(weather.uvIndex)")
                Spacer()
                WeatherStatView(title: Constants.feelsLikeTitle, value: "\(weather.feelsLikeTemperature)°")
                Spacer()
            }
            .frame(height: 75)
            .background(ColorConstants.lighterGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 56)
        }
        .padding()
        .background(Color.clear)
        .onTapGesture {
            hideKeyboard()
        }
    }
}
