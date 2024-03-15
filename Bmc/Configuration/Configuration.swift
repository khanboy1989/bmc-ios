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


/// Configuration file that instantiate the ApiClient Service.
class Configuration: ObservableObject {
    private let logger: ILogger
    private let apiClientService: IAPIClientService
    
    init() {
        
        let logger = Logger(label: Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "BMC")

        let currentLanguageCode = Locale.current.language.languageCode?.identifier ?? "tr"
        
        let apiClientService = APIClientService(logger: logger, configuration: .init(baseURL: URL(string: PlistFiles.apiBaseUrl),
                                                                                     baseHeaders: ["User-agent": "iOS", "X-API-KEY":"\(PlistFiles.apiKey)",
                                                                                                   "content-type": "application/json", "Accept-Language": currentLanguageCode]))
        self.logger = logger
        self.apiClientService = apiClientService
    }
}
