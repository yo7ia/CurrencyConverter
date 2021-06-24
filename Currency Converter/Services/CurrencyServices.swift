//
//  CurrencyService.swift
//  FixerIoCurrencyConverter (iOS)
//
//  Created by Ahmed Yehia on 24/06/2021.
//


import Foundation
import Alamofire
import SwiftyJSON

class CurrencyService {
    static let instance = CurrencyService()
    
    var currencies = [Currency]()
    var selectedCurrency: Currency?
    
    func getLatestCurrencyValues(completion: @escaping CompletionHandler) {
        currencies = []
        
        Alamofire.request("\(LASTEST_URL)&base=\(BASE_CURRENCY)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                if let json = JSON(data: data).dictionary {
                    if let values = json["rates"] {
                        for (key, value) in values {
                            let symbol = key
                            let rate = value.doubleValue
                            let country = IsoCountryCodes.searchByCurrency(symbol).first
                            self.currencies.append(Currency(symbol: symbol, name: country?.name, value: "\(rate)",flag: country?.flag))
                        }
                        self.currencies = self.currencies.sorted {
                            $0.symbol < $1.symbol
                        }
                        completion(true)
                    }
                } else {
                    debugPrint("No values available")
                    completion(false)
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    
}
