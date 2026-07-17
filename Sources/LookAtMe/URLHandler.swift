//
//  URLHandler.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/16/26.
//

import SwiftUI
import UniformTypeIdentifiers

/// An observable object that uses its lifecycle as the lifecycle of the URL scope access.
///
/// URL Security Scopes are gained at initialization and released at de-init. This ensures that access is always de-inited.
@Observable
class URLHandler {
    var url: URL
    var type: UTType
    
    private var accesingSecurityScope: Bool = false
    
    init(url: URL) throws {
        self.url = url
        
        // TOOD: Detect if the URL is sandboxed so we can throw an approriate error when we can't access the URL.
        let accesing = url.startAccessingSecurityScopedResource()
        self.accesingSecurityScope = accesing

        guard let fileType = UTType(filenameExtension: url.pathExtension) else { throw LookAtMeError.unkownExtension  }
        self.type = fileType
    }
    
    deinit {
        if accesingSecurityScope {
            url.stopAccessingSecurityScopedResource()
        }
    }
}
