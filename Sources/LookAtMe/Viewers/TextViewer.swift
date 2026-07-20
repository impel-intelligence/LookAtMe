//
//  PlainTextViewer.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/16/26.
//

import SwiftUI
import UniformTypeIdentifiers
import Cocoa
import Textual

public struct TextViewer: Viewer, View {
    public static let supportedTypes: [UTType] = [.text, .plainText, .utf8PlainText, .utf16PlainText, .utf16ExternalPlainText, UTType(importedAs: "net.daringfireball.markdown")]
    
    @State public var url: URL
    @State public var color: Color
    
    var content: String
        
    public init(url: URL, color: Color) {
        self.url = url
        self.color = color

        var usedEncoding: String.Encoding = .utf8
        let stringContent = try? String(contentsOf: url, usedEncoding: &usedEncoding)
        self.content = stringContent ?? ""
    }
    
    public var body: some View {
        ScrollView {
            StructuredText(markdown: content)
                .foregroundStyle(color.isDark ? .white : .black)
                .padding(10)
        }
        .background(color)
    }
}


#Preview {
    TextViewer(
        url: previewResourceLocation.appending(path: "txt/Lorem.txt"),
        color: .pink
    )
}
