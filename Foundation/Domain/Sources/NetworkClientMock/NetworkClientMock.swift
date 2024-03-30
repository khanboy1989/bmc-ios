//
//  File.swift
//  
//
//  Created by Serhan Khan on 26.03.24.
//

import Foundation

public func createAdminClientMock() -> INetworkClient {
    return AdminNetworkClient(apiClientService: createAPIClientServiceMock(), keyChainService: createKeychainMock(serviceIdentifier: "com.example.test.application"))
}
