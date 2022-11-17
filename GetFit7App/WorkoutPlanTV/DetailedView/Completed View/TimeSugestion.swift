//
//  TimeSugestion.swift
//  GetFit7App
//
//  Created by Venkatram G V on 17/10/22.
//

import Foundation
import UIKit
class TimeSuggestion{
    func dateFormatter() -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        return dateFormatter
    }
    
    func dateFormatterTomorrow() -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }

    func morningTime(time: String) -> Date{
        var a = Date()
        if let date = dateFormatter().date(from: "\(time), 6:00 AM") {
            print(round((Double(date.timeIntervalSinceNow) / 3600) * 100) / 100)
            print(dateFormatter().string(from: date))
            a = date
        } else {
            print("There was an error decoding the string")
        }
        return a
    }
    
    func nightTime(time: String) -> Date{
        var a = Date()
        if let date = dateFormatter().date(from: "\(time), 6:00 PM") {
            print(round((Double(date.timeIntervalSinceNow) / 3600) * 100) / 100)
            a = date
            print(dateFormatter().string(from: date))
        } else {
            print("There was an error decoding the string")
        }
        return a
    }

}
