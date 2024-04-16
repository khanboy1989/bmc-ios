//
//  String+Ext.swift
//
//
//  Created by Serhan Khan on 10/03/2024.
//

import Foundation

public extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }
    
    func toDate(with format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        // Parse the string into a Date object
        guard let date = dateFormatter.date(from: self) else { return "" }
        // Set up another date formatter for the desired output format
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd-MM-yyyy"
        
        // Convert the Date object to a string with the desired format
        let formattedString = outputFormatter.string(from: date)
        return formattedString
        
    }
}
