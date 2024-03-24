//
//  UserDefaults.swift
//
//
//  Created by Serhan Khan on 23/03/2024.
//

import Foundation

/// Protocol for interacting with the UserDefaults service.
public protocol IUserDefaultsService {
    /// Saves an encodable value to UserDefaults for a given key.
    /// - Parameters:
    ///   - value: The value to be saved.
    ///   - key: The key under which to save the value.
    func saveToUserDefaults<T: Encodable>(_ value: T, for key: String)
    
    /// Stores a boolean value to UserDefaults for a given key.
    /// - Parameters:
    ///   - type: The boolean of the value to be stored.
    ///   - key: The key under which the value is saved.
    /// - Returns: The boolean value, or nil if it couldn't be loaded.
    func storeBoolean(_ value: Bool, for key: String)
    
    /// Loads a decodable value from UserDefaults for a given key.
    /// - Parameters:
    ///   - type: The type of the value to be loaded.
    ///   - key: The key under which the value is saved.
    /// - Returns: The decoded value, or nil if it couldn't be loaded.
    func loadFromUserDefaults<T: Decodable>(_ type: T.Type, for key: String) -> T?
    
    /// Removes the value associated with the specified key from UserDefaults.
    /// - Parameter key: The key whose associated value should be removed.
    func removeFromUserDefaults(for key: String)
    
    

}

/// Class implementing the UserDefaultsService protocol.
public class UserDefaultsService: IUserDefaultsService {
    // UserDefaults instance
    private let userDefaults: UserDefaults
    
    /// Initializes the UserDefaultsService with a UserDefaults instance.
    /// - Parameter userDefaults: The UserDefaults instance to use.
    public init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    // MARK: - IUserDefaultsService
    
    /// Saves an encodable value to UserDefaults for a given key.
    /// - Parameters:
    ///   - value: The value to be saved.
    ///   - key: The key under which to save the value.
    public func saveToUserDefaults<T: Encodable>(_ value: T, for key: String) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(value)
            userDefaults.set(data, forKey: key)
        } catch {
            print("Error encoding value: \(error.localizedDescription)")
        }
    }
    
    /// Loads a decodable value from UserDefaults for a given key.
    /// - Parameters:
    ///   - type: The type of the value to be loaded.
    ///   - key: The key under which the value is saved.
    /// - Returns: The decoded value, or nil if it couldn't be loaded.
    public func loadFromUserDefaults<T: Decodable>(_ type: T.Type, for key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let value = try decoder.decode(type, from: data)
            return value
        } catch {
            print("Error decoding value: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// Removes the value associated with the specified key from UserDefaults.
    /// - Parameter key: The key whose associated value should be removed.
    public func removeFromUserDefaults(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    /// Stores a boolean value to UserDefaults for a given key.
    /// - Parameters:
    ///   - type: The boolean of the value to be stored.
    ///   - key: The key under which the value is saved.
    /// - Returns: The boolean value, or nil if it couldn't be loaded.
    public func storeBoolean(_ value: Bool, for key: String) {
        userDefaults.setValue(value, forKey: key)
    }
}
