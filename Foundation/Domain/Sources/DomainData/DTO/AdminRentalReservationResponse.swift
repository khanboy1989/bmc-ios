//
//  AdminRentalReservationsResponse.swift
//
//
//  Created by Serhan Khan on 02/04/2024.
//

import Foundation


struct AdminRentalReservationResponse: Decodable {
    let id: Int
    let imo: String
    let isArchieved: Bool
    let colorEn: String
    let colorTr: String
    let finalDailyRentPrice: String
    let gearTypeId: Int
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imo = "imo_no"
        case isArchieved = "is_archived"
        case colorEn = "color_en"
        case colorTr = "color_tr"
        case finalDailyRentPrice = "final_daily_rent_price"
        case gearTypeId = "gear_type_id"
        case image
    }
}

/*
            "updated_by":1,
            "updated_at":"2024-03-12T17:36:38.000000Z",
           
            "engine_power":1340,
            "year":"2014",
            "plate":"ZPK451",
            "details":"MAZDA/DEMIO/SMOKED/2014/ZPK451",
            "car_model_id":6,
            "is_transportation_only":0,
            "fuel_type_id":1,
            "door_count":4,
            "deleted_by":null,
            "car_type_id":3,
            "car_size_id":1,
            "deleted_at":null,
            "created_by":4,
            "car_class_id":4,
            "created_at":"2023-11-10T13:56:42.000000Z",
         "real_daily_rent_price":"23.31",
         "payment_status":"Canceled",
         "reservation_agreement":1,
         "currency_type_abbreviation":"EUR",
         "currency_symbol":"€",
         "end_date":"2024-01-31 00:00:00",
         "total_price_by_currency":"291.24",
         "flight_no":"dsds",
         "updated_at":"2024-01-30T18:04:13.000000Z",
         "customer_id":null,
         "currency_type_definition":"Euros",
         "payment_method":"Virtual Post Via Online",
         "total_rent_price":"209.79",
         "total_extra_service_price":"58.14",
         "id":3,
         "price_type":"14-30 Days",
         "total_price":"291.24",
         "currency_rate":"0.86",
         "start_date":"2024-01-22 00:00:00",
         "created_at":"2024-01-21T20:03:05.000000Z",
         "reservation_status":"Canceled",
         "transfer_cost":"23.31",
         "comment":"sdsds",
         "drop_location":null,
         "address":"dsdsds"
*/
