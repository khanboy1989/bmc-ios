//
//  AdminDashboardAbilities.swift
//
//
//  Created by Serhan Khan on 25/03/2024.
//

import Foundation

struct AdminDashboardAbilitiesResponse: Decodable {
    let customerType: AdminCustomerTypeAbilitiesResponse
    let admin: AdminUserAbilitiesResponse
    let documentType: AdminDocumentTypeAbilitiesResponse
    let customer: AdminCustomerAbiltiesResponse
    let about: AdminAboutUsAbilitiesResponse
    let workingHour: AdminWorkingHoursAbilitiesResponse
    let contact: AdminContactAbilitiesResponse
}

struct AdminCustomerTypeAbilitiesResponse: Decodable {
    let read: Bool
}

struct AdminUserAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminDocumentTypeAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminContactAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminAboutUsAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminWorkingHoursAbilitiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}

struct AdminCustomerAbiltiesResponse: Decodable {
    let store: Bool
    let update: Bool
    let read: Bool
    let destroy: Bool
}
