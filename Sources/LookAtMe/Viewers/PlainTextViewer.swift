//
//  PlainTextViewer.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/16/26.
//

import SwiftUI
import UniformTypeIdentifiers
import Cocoa

public struct PlainTextViewer: Viewer, View {
    public static let supportedTypes: [UTType] = [.text, .plainText, .utf8PlainText, .utf16PlainText, .utf16ExternalPlainText, UTType(importedAs: "net.daringfireball.markdown")]
    
    @State public var url: URL
    @State public var color: Color
    
    @State var content: String
        
    public init(url: URL, color: Color) {
        self.url = url
        self.color = color

        var usedEncoding: String.Encoding = .utf8
        let stringContent = try? String(contentsOf: url, usedEncoding: &usedEncoding)
        self.content = stringContent ?? ""
    }
    
    public var body: some View {
        TextEditor(text: $content)
    }
}

#Preview {
    PlainTextViewer(url: previewResourceLocation.appending(path: "txt/Shakespeare.txt"), color: .indigo)
}

