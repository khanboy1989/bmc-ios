//
//  Configuration.swift
//  Bmc
//
//  Created by Serhan Khan on 09/03/2024.
//

import Foundation
import Logger
import Network
import Router


class Configuration: ObservableObject {
    let logger: ILogger
    let apiClientService: IAPIClientService
    
    init(logger: ILogger, apiClientService: IAPIClientService) {
        self.logger = logger
        self.apiClientService = apiClientService
    }
    
    
}
