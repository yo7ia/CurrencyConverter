//
//  Constants.swift
//  FixerIoCurrencyConverter (iOS)
//
//  Created by Ahmed Yehia on 24/06/2021.
//

import Foundation

// makes type CompletionHandler type Success which is a bool
typealias CompletionHandler = (_ Success: Bool) -> ()

let API_KEY = "e4fd693375823564fe8c1c8e5ff56c2d"
let API_URL = "http://data.fixer.io/api"
let LASTEST_URL = "\(API_URL)/latest?access_key=\(API_KEY)"
var BASE_CURRENCY_NAME = "Euro"
var BASE_CURRENCY = "EUR"
var BASE_VALUE = 1.00
