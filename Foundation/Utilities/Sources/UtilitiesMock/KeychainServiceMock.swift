//
//  KeychainServiceMock.swift
//  
//
//  Created by Serhan Khan on 26.03.24.
//

import Foundation

public func createKeychainMock(serviceIdentifier: String) -> IKeychainService {
    return KeychainService(serviceIdentifier: serviceIdentifier)
}
