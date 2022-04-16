//
//  TDStructures.swift
//  PremiaMobile
//
//  Created by Justin Scofield on 4/16/22.
//

import Foundation

var defString = String(stringLiteral: "")
var defInt = -1
var defDouble = -1.0

struct PriceHistoryData: Codable, CustomStringConvertible {
    var candles: [Candle]?
    var empty: Bool = false
    var symbol: String?
    
    var description: String {
        let desc = """
        symbol = \(symbol ?? defString)
        """
        return desc
    }
}

struct Candle: Codable {
    var close: Double?
    var datetime: Int64?
    var high: Double?
    var low: Double?
    var open: Double?
    var volume: Double?
}

struct UserData: Codable, CustomStringConvertible {
    var page: Int?
    var perPage: Int?
    var total: Int?
    var totalPages: Int?
    var data: [User]?
    
    var description: String {
        var desc = """
        page = \(page ?? defInt)
        records per page = \(perPage ?? defInt)
        total records = \(total ?? defInt)
        total pages = \(totalPages ?? defInt)
        Users:
        
        """
        if let users = data {
            for user in users {
                desc += user.description
            }
        }
        return desc
    }
    
    struct User: Codable, CustomStringConvertible {
        var id: Int?
        var firstName: String?
        var lastName: String?
        var avatar: String?

        var description: String {
            return """
            ------------
            id = \(id ?? defInt)
            firstName = \(firstName ?? defString)
            lastName = \(lastName ?? defString)
            avatar = \(avatar ?? defString)
            ------------
            """
        }
    }

}
