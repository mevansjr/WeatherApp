//
//  WeatherStatView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A view representing a weather statistic with a title and value.
///
/// This view is used to display a weather-related statistic (such as humidity, UV index, or feels-like temperature) in a vertical stack with the title and value displayed in a formatted way.

struct WeatherStatView: View {
    
    /// The title for the weather statistic.
    let title: String
    
    /// The value of the weather statistic.
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(ColorConstants.normalGray)
                .font(.custom(FontConstants.regularFont, size: FontConstants.xSmallFontSize))
            Text(value)
                .foregroundColor(ColorConstants.darkerGray)
                .font(.custom(FontConstants.regularFont, size: FontConstants.xSmallFontSize))
        }
    }
}
