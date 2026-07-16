//
//  URL+IsSecurityScoped.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/16/26.
//

import Foundation

extension URL {
    func isSecurityScoped() -> Bool {
        (try? self.bookmarkData(options: .withSecurityScope, includingResourceValuesForKeys: nil, relativeTo: nil)) != nil
    }
}
