//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import SwiftUI

/// A simple loading indicator view.
///
/// This view displays a `ProgressView`, which is a native SwiftUI component used to show an indeterminate loading state. It centers the loading indicator vertically with spacing on both sides, making it ideal for use during network requests or other loading processes.
///
/// # Features
/// - Displays a centered loading spinner.
struct LoadingView: View {
    // MARK: - Body

    var body: some View {
        Spacer()
        ProgressView()  // A native SwiftUI loading indicator
        Spacer()
    }
}
