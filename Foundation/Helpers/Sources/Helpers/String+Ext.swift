//
//  File.swift
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
}
