//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Edwin Przeźwiecki Jr. on 10/01/2023.
//

import Foundation

/// Challenge 3:
/// Added a conformance to Equatable protocol (which is optional due to localizing an expense by its id in removing expenses functions):
struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
