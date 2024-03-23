import Foundation

/// Protocol for interacting with the Keychain service.
public protocol IKeychainService {
    /// Saves an encodable value to the Keychain for a given key.
    /// - Parameters:
    ///   - value: The value to be saved.
    ///   - key: The key under which to save the value.
    /// - Throws: An error if saving fails.
    /// - Returns: A Boolean indicating whether the save operation was successful.
    func saveToKeychain<T: Encodable>(_ value: T, for key: String) throws -> Bool
    
    /// Loads a decodable value from the Keychain for a given key.
    /// - Parameters:
    ///   - type: The type of the value to be loaded.
    ///   - key: The key under which the value is saved.
    /// - Throws: An error if loading fails.
    /// - Returns: The decoded value, or nil if it couldn't be loaded.
    func loadFromKeychain<T: Decodable>(_ type: T.Type, for key: String) throws -> T?
    
    /// Removes the value associated with the specified key from the Keychain.
    /// - Parameter key: The key whose associated value should be removed.
    /// - Throws: An error if removal fails.
    func removeFromKeychain(for key: String) throws
}

/// Class implementing the KeychainService protocol.
public class KeychainService: IKeychainService {
    // Service identifier
    private let serviceIdentifier: String
    
    /// Initializes the KeychainService with a service identifier.
    /// - Parameter serviceIdentifier: The service identifier.
    public init(serviceIdentifier: String) {
        self.serviceIdentifier = serviceIdentifier
    }
    
    // MARK: - KeychainService
    
    /// Saves an encodable value to the Keychain for a given key.
    /// - Parameters:
    ///   - value: The value to be saved.
    ///   - key: The key under which to save the value.
    /// - Throws: An error if saving fails.
    /// - Returns: A Boolean indicating whether the save operation was successful.
    public func saveToKeychain<T: Encodable>(_ value: T, for key: String) throws -> Bool {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(value)
            
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: serviceIdentifier,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]
            
            // Delete any existing item
            try removeFromKeychain(for: key)
            
            // Add the new item
            let status = SecItemAdd(query as CFDictionary, nil)
            return status == errSecSuccess
        } catch {
            print("Error encoding value: \(error.localizedDescription)")
            throw error
        }
    }
    
    /// Loads a decodable value from the Keychain for a given key.
    /// - Parameters:
    ///   - type: The type of the value to be loaded.
    ///   - key: The key under which the value is saved.
    /// - Throws: An error if loading fails.
    /// - Returns: The decoded value, or nil if it couldn't be loaded.
    public func loadFromKeychain<T: Decodable>(_ type: T.Type, for key: String) throws -> T? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceIdentifier,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        guard status == errSecSuccess,
              let data = dataTypeRef as? Data else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let value = try decoder.decode(type, from: data)
            return value
        } catch {
            print("Error decoding value: \(error.localizedDescription)")
            throw error
        }
    }
    
    /// Removes the value associated with the specified key from the Keychain.
    /// - Parameter key: The key whose associated value should be removed.
    /// - Throws: An error if removal fails.
    public func removeFromKeychain(for key: String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceIdentifier,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw NSError(domain: NSOSStatusErrorDomain, code: Int(status))
        }
    }
}


