//
//  TDManager.swift
//  PremiaMobile
//
//  Created by Justin Scofield on 4/16/22.
//

import Foundation

class TDManager {
    let client = TDClient()
    var parser: TDParser?
    
    func getPriceHistory(ticker: String) {
        guard let url = URL(string: "https://api.tdameritrade.com/v1/marketdata/" + ticker + "/pricehistory") else { return }
     
        client.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let priceHistoryData = try? decoder.decode(PriceHistoryData.self, from: data) else { return }
                print(priceHistoryData.description)
            }
        }
    }
}


