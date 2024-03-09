//
//  File.swift
//
//
//  Created by Serhan Khan on 04/01/2024.
//

import Foundation

import Network
import Logger

public func createAPIClientServiceMock() -> IAPIClientService {
#if DEBUG
    return APIClientService(
        logger: NoLogger(label: ""),
        configuration: .init(
            baseURL: URL(string: "https://api.themoviedb.org"),
            baseHeaders: [
                "accept": "application/json",
                "content-type": "application/json"
            ]
        )
    )
#else
    return APIClientService(
        logger: NoLogger(label: ""),
        configuration: .init(
            baseURL: URL(string: "https://api.themoviedb.org"),
            baseHeaders: [
                "accept": "application/json",
                "content-type": "application/json"
            ]
        )
    )
    
#endif
    
}
