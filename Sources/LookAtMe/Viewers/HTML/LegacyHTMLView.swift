//
//  LegacyHTMLView.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/20/26.
//


import SwiftUI
import WebKit

#if canImport(AppKit)
struct LegacyHTMLView: NSViewRepresentable {
    let url: URL

    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateNSView(_ webView: WKWebView, context: Context) {
        webView.loadFileURL(url, allowingReadAccessTo: url)
    }
}
#elseif canImport(UIKit)
struct LegacyHTMLView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }
}
#endif
