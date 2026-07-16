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
        
        // If the URL is security scoped, grab its resource. If we can't access the resource throw an error
        if url.isSecurityScoped() {
            let accesing = url.startAccessingSecurityScopedResource()
            guard accesing else { throw LookAtMeError.urlOutOfSandbox }
            self.accesingSecurityScope = accesing
        }

        guard let fileType = UTType(filenameExtension: url.pathExtension) else { throw LookAtMeError.unkownExtension  }
        self.type = fileType
    }
    
    deinit {
        if accesingSecurityScope {
            url.stopAccessingSecurityScopedResource()
        }
    }
}
