//
//  PDFViewer.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/16/26.
//

import SwiftUI
import UniformTypeIdentifiers
import Cocoa
import PDFKit

public struct PDFViewer: Viewer, View {
    public static let supportedTypes: [UTType] = [ .pdf ]
    
    @State public var url: URL
    @State public var color: Color
        
    @State private var hasResetPosition: Bool = false
    
    public init(url: URL, color: Color) {
        self.url = url
        self.color = color
    }
    
    public var body: some View {
        PDFKitWrapper(url: url, color: color)
    }
}

struct PDFKitWrapper: NSViewRepresentable {
    let url: URL
    let color: Color
        
    func makeNSView(context: Context) -> PDFKit.PDFView {
        let view = PDFView()
        view.backgroundColor = NSColor(color)
        view.document = PDFDocument(url: url)
        
        return view
    }
    
    func updateNSView(_ pdfView: PDFKit.PDFView, context: Context) {
        pdfView.document = PDFDocument(url: url)
    }
}

#Preview {
    PDFViewer(url: previewResourceLocation.appending(path: "pdf/somatosensory.pdf"), color: .teal)
}

