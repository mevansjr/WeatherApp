//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A view displaying an error message.
///
/// This view is used to present an error message when something goes wrong, such as a network failure or invalid user input. It shows a title for the error, followed by the specific error message. The view also includes a gesture recognizer to dismiss the keyboard when tapped.
///
/// # Features
/// - Displays a title and a message describing the error.
struct ErrorView: View {
    // MARK: - Properties
    
    /// The error message to be displayed in the view.
    let errorMessage: String

    // MARK: - Body

    var body: some View {
        VStack(spacing: 15) {
            Text(Constants.errorTitle)  // Title of the error message
                .font(.custom(FontConstants.semiBoldFont, size: FontConstants.largeFontSize))
                .multilineTextAlignment(.center)

            Text(errorMessage)  // The actual error message
                .font(.custom(FontConstants.regularFont, size: FontConstants.smallFontSize))
                .multilineTextAlignment(.center)
        }
        .background(.clear)
        .padding(.horizontal, 32)  // Horizontal padding for the error message
        .onTapGesture {
            hideKeyboard()  // Dismiss the keyboard if tapped
        }
    }
}
