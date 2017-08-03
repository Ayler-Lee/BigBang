//
//  NSString+Extension.swift
//  BigBang.Swift
//
//  Created by Yale Li on 2017/8/2.
//  Copyright © 2017年 ttpai. All rights reserved.
//

import Foundation

public enum PINSegmentationOptions {
    case None
    case Deduplication
    case KeepEnglish
    case KeepSymbols

}

extension NSString {
    public func segment(_ options: PINSegmentationOptions) -> [String] {
        
        let deduplication = options == PINSegmentationOptions.Deduplication
        let keepSymbols = options == PINSegmentationOptions.KeepSymbols
//        print(deduplication, keepSymbols)
        let flags = keepSymbols ? kCFStringTokenizerUnitWordBoundary : kCFStringTokenizerUnitWord
        
        var results = [String]();
        let textRange = CFRange(location: 0, length: self.length)
        let currentRef = CFLocaleCopyCurrent()
        
        let tokenizerRef = CFStringTokenizerCreate(nil, self, textRange, flags, currentRef)
        CFStringTokenizerAdvanceToNextToken(tokenizerRef)
        let resultSet = NSMutableSet()
        
        while true {
            let tokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizerRef)
            
            if tokenRange.location == kCFNotFound && tokenRange.length == 0 {
                break
            }
            
            let token = substring(with: NSMakeRange(tokenRange.location, tokenRange.length))
            let item = token.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if item.characters.count > 0 {
                if deduplication {
                    if !resultSet.contains(item) {
                        results.append(item)
                    }
                    resultSet.add(item)
                } else {
                    results .append(item)
                }
            }
            
            CFStringTokenizerAdvanceToNextToken(tokenizerRef)
        }
        
//        CFRelease(tokenizerRef);  // autoRelease
//        CFRelease(currentRef);
        return results;
    }
}
