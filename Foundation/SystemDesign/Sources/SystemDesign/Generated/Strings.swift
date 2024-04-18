// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Admin Login
  public static let adminLogin = L10n.tr("Localizable", "adminLogin", fallback: "Admin Login")
  /// Customer Email:
  public static let customerEmail = L10n.tr("Localizable", "customerEmail", fallback: "Customer Email:")
  /// Customer Name:
  public static let customerName = L10n.tr("Localizable", "customerName", fallback: "Customer Name:")
  /// Customer Phone No:
  public static let customerPhoneNo = L10n.tr("Localizable", "customerPhoneNo", fallback: "Customer Phone No:")
  /// Customer Surname:
  public static let customerSurname = L10n.tr("Localizable", "customerSurname", fallback: "Customer Surname:")
  /// Driver Licence No:
  public static let driverLicenceNo = L10n.tr("Localizable", "driverLicenceNo", fallback: "Driver Licence No:")
  /// Drop-Off Date
  public static let dropOffDate = L10n.tr("Localizable", "dropOffDate", fallback: "Drop-Off Date")
  /// Drop-off Location:
  public static let dropOffLocation = L10n.tr("Localizable", "dropOffLocation", fallback: "Drop-off Location:")
  /// Email
  public static let email = L10n.tr("Localizable", "email", fallback: "Email")
  /// E-mail field could not be empty
  public static let emailEmptyError = L10n.tr("Localizable", "emailEmptyError", fallback: "E-mail field could not be empty")
  /// E-mail is invalid
  public static let emailIsInvalid = L10n.tr("Localizable", "emailIsInvalid", fallback: "E-mail is invalid")
  /// E-mail is valid
  public static let emailIsValid = L10n.tr("Localizable", "emailIsValid", fallback: "E-mail is valid")
  /// Female
  public static let female = L10n.tr("Localizable", "female", fallback: "Female")
  /// Forgot Password
  public static let forgotPassword = L10n.tr("Localizable", "forgotPassword", fallback: "Forgot Password")
  /// Login
  public static let login = L10n.tr("Localizable", "login", fallback: "Login")
  /// Male
  public static let male = L10n.tr("Localizable", "male", fallback: "Male")
  /// Ok
  public static let ok = L10n.tr("Localizable", "ok", fallback: "Ok")
  /// Other
  public static let other = L10n.tr("Localizable", "other", fallback: "Other")
  /// Password
  public static let password = L10n.tr("Localizable", "password", fallback: "Password")
  /// Password field could not be empty
  public static let passwordFieldEmptyError = L10n.tr("Localizable", "passwordFieldEmptyError", fallback: "Password field could not be empty")
  /// Pickup Date
  public static let pickupDate = L10n.tr("Localizable", "pickupDate", fallback: "Pickup Date")
  /// Pickup location:
  public static let pickupLocation = L10n.tr("Localizable", "pickupLocation", fallback: "Pickup location:")
  /// Rental Cars
  public static let rentalCarsHeaderTitle = L10n.tr("Localizable", "rentalCarsHeaderTitle", fallback: "Rental Cars")
  /// Rentals
  public static let rentalTabItemTitle = L10n.tr("Localizable", "rentalTabItemTitle", fallback: "Rentals")
  /// Localizable.strings
  ///   
  /// 
  ///   Created by Serhan Khan on 12.03.24.
  public static let systemLanguage = L10n.tr("Localizable", "systemLanguage", fallback: "en")
  /// Total Rent Price:
  public static let totalRentPrice = L10n.tr("Localizable", "totalRentPrice", fallback: "Total Rent Price:")
  /// Transfer Reservations
  public static let tranferReservationsTitle = L10n.tr("Localizable", "tranferReservationsTitle", fallback: "Transfer Reservations")
  /// Transfers
  public static let transferTabItemTitle = L10n.tr("Localizable", "transferTabItemTitle", fallback: "Transfers")
  /// Unknown error.
  public static let unknownError = L10n.tr("Localizable", "unknownError", fallback: "Unknown error.")
  /// Please enter valid credentials.
  public static let wrongCredentials = L10n.tr("Localizable", "wrongCredentials", fallback: "Please enter valid credentials.")
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
