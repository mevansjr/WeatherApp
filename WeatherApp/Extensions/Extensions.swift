//
//  Extensions.swift
//  WeatherApp
//
//  Created by Mark Evans on 1/21/25.
//

import Foundation
import UIKit
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
