//
//  HTMLViewer.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/20/26.
//

import SwiftUI
import UniformTypeIdentifiers
import Cocoa
import Textual
import WebKit

public struct HTMLViewer: Viewer, View {
    public static let supportedTypes: [UTType] = [ .html ]
    
    @State public var url: URL
    @State public var color: Color
            
    public init(url: URL, color: Color) {
        self.url = url
        self.color = color
    }
    
    // We are using a legacy WebView since the more modern WebView struggles to load sandboxed content. It will throw 'Could not create a sandbox extension for '/'' whenever it tries to load a url that is security scoped.
    public var body: some View {
//        if #available(macOS 26.0, iOS 26.0, tvOS 26.0, *) {
//            WebView(url: url)
//        } else {
        LegacyHTMLView(url: url)
//        }
    }
}


#Preview {
    if #available(macOS 26.0, *) {
        HTMLViewer(
            url: previewResourceLocation.appending(path: "html/test.html"),
            color: .pink
        )
    } else {
        // Fallback on earlier versions
    }
}
