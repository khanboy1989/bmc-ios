//
//  File.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation
import Network



enum ApiEndpoints {
    static func adminLogin(email: String, password: String) -> APIEndpoint {
        .init(path: "\(EndpointPrefix.api)\(EndpointPrefix.version)/admin/auth/login", httpMethod: .post, bodyParameters: .dictionary(["email": email, "password": password]))
    }
    
}
