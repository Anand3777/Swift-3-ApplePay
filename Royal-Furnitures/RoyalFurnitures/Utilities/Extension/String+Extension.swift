//
//  String+Extension.swift
//  Laundry Web
//
//  Created by A2 MacBook Pro 2012 on 23/11/21.
//

import Foundation
import UIKit

extension String {
    func removeTrailingZeros() -> String {
        return String(format: "%.0f", self)
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue.rounded(toPlaces: 2)
    }
    
    func removePlusFromDialCode(_ dialCode: String) -> String {
        let cleanedDialCode = dialCode.replacingOccurrences(of: "+", with: "")
        return cleanedDialCode
    }
    
    func changeTimeToFormat(frmFormat: String, toFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = frmFormat
        
        if let dateFromString = dateFormatter.date(from: self) {
            let formatter = DateFormatter()
          //  formatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = toFormat
            let dateString = formatter.string(from: dateFromString)
            return dateString
        }
        return self
    }
    
    func convertGMTToLocalTime(gmtTime: String, frmFormat: String, toFormat:String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = frmFormat // Specify the date format of your GMT time
        dateFormatter.timeZone = TimeZone(identifier: "GMT")

        if let date = dateFormatter.date(from: gmtTime) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = toFormat
            let localTime = dateFormatter.string(from: date)
            return localTime
        }
        return nil
    }
    
    func changeDateToFormat(frmFormat:String,toFormat:String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = frmFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        
        if let dateFromString = dateFormatter.date(from: self){
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = toFormat
            let dateString = formatter.string(from: dateFromString)
            return dateString
        }
        return self
        
    }
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

extension String {
    public func htmlAttributedString() -> NSAttributedString? {
        let htmlData = NSString(string: self).data(using: String.Encoding.unicode.rawValue)
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
                        NSAttributedString.DocumentType.html]
        
        let attributedString = try? NSMutableAttributedString(data: htmlData ?? Data(),
                                                              options: options,
                                                              documentAttributes: nil)
        return attributedString
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    var htmlAttributed: (NSAttributedString?, NSDictionary?) {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return (nil, nil)
            }
            
            var dict:NSDictionary?
            dict = NSMutableDictionary()
            
            return try (NSAttributedString(data: data,
                                           options: [.documentType: NSAttributedString.DocumentType.html,
                                                     .characterEncoding: String.Encoding.utf8.rawValue],
                                           documentAttributes: &dict), dict)
        } catch {
            print("error: ", error)
            return (nil, nil)
        }
    }
    
    func htmlAttributed(using font: UIFont, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
            "html *" +
            "{" +
            "font-size: \(font.pointSize)pt !important;" +
            "color: #\(color.toHex ?? "") !important;" +
            "font-family: \(font.familyName), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    

    
}
