//
//  Colors+IsDark.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/20/26.
//

import SwiftUI
import Foundation

extension Color {
    /// Checks to see if a color is "dark" through luminance calculations.
    ///
    /// Derived from: https://stackoverflow.com/a/946734/14886210
    /// Steps:
    /// - Convert to gray (formula): R*0.299 + G*0.587 + B*0.114
    /// - Check if the color is more dark than light (gray scale < 0.5)
    var isDark: Bool {
        #if canImport(AppKit)
        guard let srgb = NSColor(self).usingColorSpace(.sRGB) else { return false }
        #elseif canImport(UIKit)
        guard let srgb = UIColor(self).usingColorSpace(.sRGB) else { return false }
        #endif
        let grayScale = 0.299 * srgb.redComponent + 0.587 * srgb.greenComponent + 0.114 * srgb.blueComponent
        
        return grayScale < 0.5
    }
}
