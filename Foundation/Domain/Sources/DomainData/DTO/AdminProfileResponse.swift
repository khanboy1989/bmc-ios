//
//  File.swift
//  
//
//  Created by Serhan Khan on 24/03/2024.
//

import Foundation


enum AdminRole: String, Decodable {
    case superadmin = "superadmin"
    case admin = "admin"
    case accountant = "accountant"
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
}





/*
 {
   "data" : {
     "gender" : "Male",
     "country" : "Pakistan",
     "id" : 4,
     "lastname" : "Test",
     "firstname" : "Serhan",
     "role" : "superadmin",
     "username" : "serhan",
     "email" : "serhan@test.com",
     "phone_no" : "925338888888",
     "profile_image" : "profile_images/6585ec93762665.97184142.jpg",
     "abilities" : {
       "profile" : {
         "me" : {
           "read" : true,
           "update" : true
         }
       },
       "dashboard" : {
         "customerType" : {
           "read" : true
         },
         "admin" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "documentType" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "contact" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "customer" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "about" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "workingHour" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         }
       },
       "cars" : {
         "fuelType" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "car" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "gearType" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "model" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "size" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "class" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "brand" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "spec" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "type" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         },
         "price" : {
           "store" : true,
           "update" : true,
           "read" : true,
           "destroy" : true
         }
       }
     }
   }
 }
 */
