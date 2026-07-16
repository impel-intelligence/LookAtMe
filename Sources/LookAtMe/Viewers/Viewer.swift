//
//  Viewer.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/16/26.
//

import SwiftUI
import UniformTypeIdentifiers

protocol Viewer: View {
    static var supportedTypes: [UTType] { get }
    
    init(url: URL, color: Color)
}

