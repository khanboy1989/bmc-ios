// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Admin Login
  internal static let adminLogin = L10n.tr("Localizable", "adminLogin", fallback: "Admin Login")
  /// Email
  internal static let email = L10n.tr("Localizable", "email", fallback: "Email")
  /// E-mail is invalid
  internal static let emailIsInvalid = L10n.tr("Localizable", "emailIsInvalid", fallback: "E-mail is invalid")
  /// E-mail is valid
  internal static let emailIsValid = L10n.tr("Localizable", "emailIsValid", fallback: "E-mail is valid")
  /// Login
  internal static let login = L10n.tr("Localizable", "login", fallback: "Login")
  /// Ok
  internal static let ok = L10n.tr("Localizable", "ok", fallback: "Ok")
  /// Password
  internal static let password = L10n.tr("Localizable", "password", fallback: "Password")
  /// Localizable.strings
  ///   Bmc
  /// 
  ///   Created by Serhan Khan on 09/03/2024.
  internal static let systemLanguage = L10n.tr("Localizable", "systemLanguage", fallback: "en")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
