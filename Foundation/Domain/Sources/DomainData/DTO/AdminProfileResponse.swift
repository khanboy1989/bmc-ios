//
//  AdminProfileResponse.swift
//
//
//  Created by Serhan Khan on 24/03/2024.
//

import Foundation
import Network
import Domain

enum AdminRole: String, Decodable {
    case superadmin = "superadmin"
    case admin = "admin"
    case accountant = "accountant"
}

struct AdminProfileDataWrapperMapper: Mappable {
    func map(_ input: AdminProfileResponseDataWrapper) throws -> AdminMainProfile {
        return try AdminProfileMapper().map(input.data)
    }
}

struct AdminProfileResponseDataWrapper: Decodable {
    let data: AdminProfileResponse
}

struct AdminProfileResponse: Decodable {
    let gender: String
    let country: String
    let id: Int
    let lastname: String
    let firstname: String
    let role: AdminRole
    let username: String
    let email: String
    let phone_no: String
    let profile_image: String
    let abilities: AdminAbilitiesResponse
}

struct AdminProfileMapper: Mappable {
    func map(_ input: AdminProfileResponse) throws -> AdminMainProfile {
        .init(gender: input.gender, country: input.country, id: input.id, lastname: input.lastname, firstname: input.firstname, role: AdminRoleType(rawValue: input.role.rawValue) ?? .admin, username: input.username, email: input.email, phone_no: input.phone_no, profileImage: input.profile_image, roles: .init(profile: .init(me: AdminMeRoles(read: input.abilities.profile.me.read, update: input.abilities.profile.me.update)), dashboard: .init(customerType: .init(read: input.abilities.dashboard.customerType.read), adminUser: .init(store: input.abilities.dashboard.admin.store, update: input.abilities.dashboard.admin.update, read: input.abilities.dashboard.admin.read, destroy: input.abilities.dashboard.admin.destroy), documentType: .init(store: input.abilities.dashboard.documentType.store, update: input.abilities.dashboard.documentType.update, read: input.abilities.dashboard.documentType.read, destroy: input.abilities.dashboard.documentType.destroy), customer: .init(store: input.abilities.dashboard.customer.store, update: input.abilities.dashboard.customer.update, read: input.abilities.dashboard.customer.read, destroy: input.abilities.dashboard.customer.destroy), about: .init(store: input.abilities.dashboard.about.store, update: input.abilities.dashboard.about.update, read: input.abilities.dashboard.about.read, destroy: input.abilities.dashboard.about.destroy), workinHours: .init(store: input.abilities.dashboard.workingHour.store, update: input.abilities.dashboard.workingHour.update, read: input.abilities.dashboard.workingHour.read, destroy: input.abilities.dashboard.workingHour.destroy), contact: .init(store: input.abilities.dashboard.contact.store , update: input.abilities.dashboard.contact.update, read: input.abilities.dashboard.contact.read, destroy: input.abilities.dashboard.contact.destroy)), car: .init(fuelType: .init(store: input.abilities.cars.fuelType.store, update: input.abilities.cars.fuelType.update, read: input.abilities.cars.fuelType.read, destroy: input.abilities.cars.fuelType.destroy), car: .init(store: input.abilities.cars.car.store, update: input.abilities.cars.car.update, read: input.abilities.cars.car.read, destroy: input.abilities.cars.car.destroy), gearType: .init(store: input.abilities.cars.gearType.store, update: input.abilities.cars.gearType.update, read: input.abilities.cars.gearType.read, destroy: input.abilities.cars.gearType.destroy), model: .init(store: input.abilities.cars.model.store, update: input.abilities.cars.model.update, read: input.abilities.cars.model.read, destroy: input.abilities.cars.model.destroy), size: .init(store: input.abilities.cars.size.store, update: input.abilities.cars.size.update, read: input.abilities.cars.size.read, destroy: input.abilities.cars.size.destroy), carClass: .init(store: input.abilities.cars.carClass.store, update: input.abilities.cars.carClass.update, read: input.abilities.cars.carClass.read, destroy: input.abilities.cars.carClass.destroy), spec: .init(store: input.abilities.cars.spec.store, update: input.abilities.cars.spec.update, read: input.abilities.cars.spec.read, destroy: input.abilities.cars.spec.destroy), carType: .init(store: input.abilities.cars.carType.store, update: input.abilities.cars.carType.update, read: input.abilities.cars.carType.read, destroy: input.abilities.cars.carType.destroy), price: .init(store: input.abilities.cars.price.store, update: input.abilities.cars.price.update, read: input.abilities.cars.price.read, destroy: input.abilities.cars.price.destroy))))
    }
}



