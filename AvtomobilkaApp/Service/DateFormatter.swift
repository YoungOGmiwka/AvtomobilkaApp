//
//  DateFormatter.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 03.08.2023.
//

import Foundation

class DateNormalFormat {
    private init() {}
    
    static let shared = DateNormalFormat()
    
    func normalizedDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let correctDateFormat = DateFormatter()
        correctDateFormat.dateFormat = "dd.MM.yyyy"
        if let date = formatter.date(from: dateString) {
            return correctDateFormat.string(from: date)
        } else {
            return dateString
        }
    }
}
