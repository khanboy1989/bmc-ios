//
//  File.swift
//  
//
//  Created by Serhan Khan on 11/03/2024.
//

import Foundation
import Network

//ApiEndpoints
enum AdminApiEndpoints {
    static func adminLogin(email: String, password: String) -> APIEndpoint {
        .init(path: "\(EndpointPrefix.api)\(EndpointPrefix.version)\(EndpointPrefix.mobile)\(EndpointPrefix.admin)/auth/login", httpMethod: .post, bodyParameters: .dictionary(["email": email, "password": password]))
    }
    
    static func refreshToken() -> APIEndpoint {
        .init(path:"\(EndpointPrefix.api)\(EndpointPrefix.version)\(EndpointPrefix.mobile)\(EndpointPrefix.admin)/auth/refresh" , httpMethod: .post)
    }
    
    static func profile() -> APIEndpoint {
        .init(path: "\(EndpointPrefix.api)\(EndpointPrefix.version)\(EndpointPrefix.mobile)\(EndpointPrefix.admin)/profile/me", httpMethod: .get)
    }
    
    static func rentalReservations() -> APIEndpoint {
        .init(path: "\(EndpointPrefix.api)\(EndpointPrefix.version)\reservations/car-rental", httpMethod: .get)
    }
}
