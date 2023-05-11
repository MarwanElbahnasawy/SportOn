//
//  DateUtility.swift
//  SportOn
//
//  Created by Marwan Elbahnasawy on 11/05/2023.
//

import Foundation

class DateUtility{
    
    static func getFromDateString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    static func getToDateString(date: Date, days: Int) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let toDate = Calendar.current.date(byAdding: .day, value: days, to: date)!
        return dateFormatter.string(from: toDate)
    }
    
}
