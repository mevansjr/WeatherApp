//
//  EmptyLocationView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A view displayed when no city is selected.
///
/// This view provides instructions to the user when no city has been selected for weather data. It includes a title prompting the user to select or search for a city, along with a description encouraging the search action.
///
/// # Features
/// - Displays a message prompting the user to search for a city.
struct EmptyLocationView: View {
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 15) {
            Text(Constants.noCityTitle)  // Title instructing the user to select a city
                .font(.custom(FontConstants.semiBoldFont, size: FontConstants.largeFontSize))
                .multilineTextAlignment(.center)

            Text(Constants.noCitySearchDescription)  // Description encouraging the user to search
                .font(.custom(FontConstants.regularFont, size: FontConstants.smallFontSize))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 32)  // Horizontal padding for the content
        .background(Color.clear)  // Clear background to maintain layout clarity
        .onTapGesture {
            hideKeyboard()  // Dismiss the keyboard if tapped
        }
    }
}
