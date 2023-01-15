//
//  CurrentCurrency.swift
//  Calculator
//
//  Created by Иван Тарасенко on 14.06.2022.
//
import Foundation
import UIKit

struct CurrencyEntity {
    var currency: [String: Currency]
    
    init?(currencyEntity: CurrentData) {
        currency = currencyEntity.valute
    }
}
