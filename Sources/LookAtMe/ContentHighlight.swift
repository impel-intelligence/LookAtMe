//
//  ContentHighlight.swift
//  LookAtMe
//
//  Created by Taylor Lineman on 7/16/26.
//

public struct ContentHighlight {
    /// The page the highlight is located on, if this is a paginated document.
    public var page: Int
    
    /// The range of characters that should be highlighted.
    public var textRange: Range<Int>
}
