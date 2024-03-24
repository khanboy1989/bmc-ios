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
import Utilities
import DomainData

/// Configuration file that instantiate the ApiClient Service.
class Configuration: ObservableObject {
    private let logger: ILogger
    private let apiClientService: IAPIClientService
    private let keyChainService: IKeychainService
    private let networkClient: INetworkClient
    private let userDefaults: IUserDefaultsService
    
    init(deviceDisplayName: String, serviceIdentifier: String) {
        let logger = Logger(label: Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "BMC")
        let currentLanguageCode = Locale.current.language.languageCode?.identifier ?? "tr"
        let apiClientService = APIClientService(logger: logger, configuration: .init(baseURL: URL(string: PlistFiles.apiBaseUrl), 
                                                                                     baseHeaders: ["User-agent": deviceDisplayName, "X-API-KEY":"\(PlistFiles.apiKey)","content-type": "application/json", "Accept-Language": currentLanguageCode]))
        let keyChainService =  KeychainService(serviceIdentifier: serviceIdentifier)
        self.logger = logger
        self.apiClientService = apiClientService
        self.keyChainService = keyChainService
        self.userDefaults = UserDefaultsService()
        self.networkClient = AdminNetworkClient(apiClientService: apiClientService, keyChainService: keyChainService)
    }
   
    func getKeyChainService() -> IKeychainService {
        return self.keyChainService
    }
    
    func getNetworkClient() -> INetworkClient {
        return self.networkClient
    }
    
    func getUserDefaultsService () -> IUserDefaultsService {
        return self.userDefaults
    }
}
