//
//  Date+Extension.swift
//  Prompted
//
//  Created by Sarah Lichter on 12/9/21.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
