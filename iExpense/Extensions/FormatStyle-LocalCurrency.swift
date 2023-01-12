//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Edwin Przeźwiecki Jr. on 11/01/2023.
//

/// Challenge 1:

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
