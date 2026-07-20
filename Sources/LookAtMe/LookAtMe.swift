// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import UniformTypeIdentifiers

internal let previewResourceLocation: URL = URL(fileURLWithPath: #filePath).deletingLastPathComponent().appending(path: "../../Tests/Test Documents")

public struct LookAtMe: View {
    @State var urlHandler: URLHandler?
    @State var loadingError: Error?
    
    var color: Color
    
    public init(url: URL, color: Color) {
        self.color = color

        do {
            let handler = try URLHandler(url: url)
            _urlHandler = State(initialValue: handler)
        } catch {
            _loadingError = State(initialValue: error)
        }
    }
    
    public var body: some View {
        if let urlHandler {
            switch urlHandler.type {
            case let item where PDFViewer.supportedTypes.contains(item):
                PDFViewer(url: urlHandler.url, color: color)
            case let item where TextViewer.supportedTypes.contains(item):
                TextViewer(url: urlHandler.url, color: color)
            case let item where HTMLViewer.supportedTypes.contains(item):
                HTMLViewer(url: urlHandler.url, color: color)
            default:
                ContentUnavailableView("Unsupported File", systemImage: "pc", description: Text("Can not open file with type \(urlHandler.type.identifier)"))
            }
        } else if let loadingError {
            ContentUnavailableView(loadingError.localizedDescription, systemImage: "pc")
        } else {
            ContentUnavailableView("Unkown Error", systemImage: "pc")
        }
    }
}


#Preview {
    LookAtMe(url: previewResourceLocation.appending(path: "pdf/somatosensory.pdf"), color: .accentColor)
}
