//
//  File.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation
import Network

//ApiEndpoints
enum ApiEndpoints {
    static func adminLogin(email: String, password: String) -> APIEndpoint {
        .init(path: "\(EndpointPrefix.api)\(EndpointPrefix.version)\(EndpointPrefix.admin)/auth/login", httpMethod: .post, bodyParameters: .dictionary(["email": email, "password": password]))
    }
    
}
