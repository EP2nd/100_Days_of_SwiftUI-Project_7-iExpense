 //
//  ExpenseSection.swift
//  iExpense
//
//  Created by Edwin Przeźwiecki Jr. on 12/01/2023.
//

/// Challenge 3:

import SwiftUI

struct ExpenseSection: View {
    
    let title: String
    let expenses: [ExpenseItem]
    let deleteExpense: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    /// Challenge 1:
                    Text(item.amount, format: .localCurrency)
                    /// Challenge 2:
                        .fontColor(for: item.amount)
                }
            }
            .onDelete(perform: deleteExpense)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "", expenses: [], deleteExpense: { _ in })
    }
}
