// The Swift Programming Language
// https://docs.swift.org/swift-book


public struct Constants {
    #if DEBUG
    public static let imageBaseUrl: String = "https://stageapi.bmcrentacar.com/storage/"
    #elseif STAGING
    public static let imageBaseUrl: String = "https://stageapi.bmcrentacar.com/storage/"
    #else
    public static let imageBaseUrl: String = "https://api.bmcrentacar.com/storage/"
    #endif
}
