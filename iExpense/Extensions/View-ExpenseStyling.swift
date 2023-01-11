//
//  View-ExpenseStyling.swift
//  iExpense
//
//  Created by Edwin Przeźwiecki Jr. on 11/01/2023.
//

import SwiftUI

/// Challenge 2:

struct AmountModifier: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
    }
}

extension View {
    func fontColor(for amount: Double) -> some View {
        switch amount {
        case 0..<10:
            return modifier(AmountModifier(color: .green))
        case 10..<100:
            return modifier(AmountModifier(color: .orange))
        default:
            return modifier(AmountModifier(color: .red))
        }
    }
}
