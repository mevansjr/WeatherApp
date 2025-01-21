//
//  TemperatureView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A view that displays the temperature with a unit symbol (°).
///
/// This view is responsible for showing the temperature value in a formatted style, with the temperature followed by the degree symbol (°). The size of the text can be adjusted via the `fontSize` parameter.
///
/// # Features
/// - Displays the temperature value as an integer.
struct TemperatureView: View {
    // MARK: - Properties

    /// The temperature value to be displayed.
    let temperature: Int

    /// The font size used for the temperature text and degree symbol.
    let fontSize: CGFloat

    // MARK: - Body

    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            Text("\(temperature)")  // Display temperature value.
                .font(.custom(FontConstants.mediumFont, size: fontSize))
            Text(Constants.degree)  // Display the degree symbol (°).
                .font(.custom(FontConstants.mediumFont, size: fontSize / 3))  // Smaller font size for the degree symbol.
        }
    }
}
