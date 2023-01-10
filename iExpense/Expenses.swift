//
//  Expenses.swift
//  iExpense
//
//  Created by Edwin Przeźwiecki Jr. on 10/01/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
