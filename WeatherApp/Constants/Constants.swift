//
//  Constants.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Foundation
import SwiftUI

enum FontConstants {
    static let semiBoldFont = "Poppins-SemiBold"
    static let mediumFont = "Poppins-Medium"
    static let regularFont = "Poppins-Regular"
    static let xSmallFontSize: CGFloat = 12
    static let smallFontSize: CGFloat = 15
    static let mediumFontSize: CGFloat = 20
    static let largeFontSize: CGFloat = 30
    static let xLargeFontSize: CGFloat = 60
    static let xxLargeFontSize: CGFloat = 70
}

enum ColorConstants {
    static let normalGray = Color("NormalGray")
    static let darkerGray = Color("DarkerGray")
    static let lighterGray = Color("LighterGray")
}
enum ImageConstants {
    static let searchIcon: Image = Image(systemName: "magnifyingglass")
    static let locationIcon: Image = Image(systemName: "location.fill")
}

enum WeatherServiceError: Error {
    case invalidURL
    case mappingError
}

struct API {
    static let apiKey: String = "2e4854f55c274763ad2170541252101"
    static let baseURL: String = "https://api.weatherapi.com/v1/current.json"
    struct QueryItem {
        static let key: String = "key"
        static let q: String = "q"
    }
}

struct Constants {
    static let iconBaseURLReplacement = "https://cdn"
    static let iconSizeReplacement = "128x128"
    static let noCityTitle: String = "No City Selected"
    static let noCitySearchDescription: String = "Please Search For A City"
    static let errorTitle: String = "Uh Oh!"
    static let searchPlaceholder: String = "Search Location"
    static let degree: String = "°"
    static let savedLocationKey = "SavedLocation"
    static let humidityTitle = "Humidity"
    static let uvTitle = "UV"
    static let feelsLikeTitle = "Feels Like"
}
