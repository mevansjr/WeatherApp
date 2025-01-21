//
//  SearchBarView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A customizable search bar view for user input.
///
/// This view presents a search bar where the user can type a search query. It includes a text field for input and an icon button to the right. It supports user input changes and submits the entered text when the user presses the "Done" button on the keyboard.
///
/// # Features
/// - Binds to a `text` property to capture user input.
struct SearchBarView: View {
    // MARK: - Properties

    /// A binding to a string value representing the search query text.
    @Binding var text: String

    /// A closure that gets called whenever the text changes.
    var onTextChanged: ((String) -> Void)?

    // MARK: - Body

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(ColorConstants.lighterGray)
                .frame(height: 46)

            HStack {
                TextField(Constants.searchPlaceholder, text: $text)  // Text field for input
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.primary)
                    .keyboardType(.default)
                    .autocorrectionDisabled()
                    .submitLabel(.done)
                    .onSubmit {
                        onTextChanged?(self.text)  // Call the onSubmit handler
                        hideKeyboard()  // Hide keyboard on submit
                    }
                    .onChange(of: text) { _, newValue in
                        onTextChanged?(newValue)  // Call onTextChanged whenever text changes
                    }

                ImageConstants.searchIcon  // Search icon on the right side
                    .foregroundColor(ColorConstants.darkerGray)
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 24)
        .onTapGesture {
            hideKeyboard()  // Hide keyboard if tapping outside the text field
        }
    }
}
