//
//  Date+Formater.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 21.01.2023.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
