//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Przeźwiecki Jr. on 09/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                /// Challenge 3:
                ExpenseSection(title: "Business", expenses: expenses.businessExpenses, deleteExpense: removeBusinessExpense)
                
                ExpenseSection(title: "Personal", expenses: expenses.personalExpenses, deleteExpense: removePersonalExpense)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeExpense(at offsets: IndexSet, in expenseArray: [ExpenseItem]) {
        for offset in offsets {
            let sectionExpense = expenseArray[offset]
            let expenseID = sectionExpense.id
            expenses.items.removeAll(where: { $0.id == expenseID })
        }
    }
    
    /// Challenge 3:
    func removeBusinessExpense(at offsets: IndexSet) {
        removeExpense(at: offsets, in: expenses.businessExpenses)
    }
    
    func removePersonalExpense(at offsets: IndexSet) {
        removeExpense(at: offsets, in: expenses.personalExpenses)
    }
    
    /// Alternative (used with conformance to Equatable):
    /* func removeExpense(at offsets: IndexSet, in expenseArray: [ExpenseItem]) {
     
        var expenseToRemove = IndexSet()
        
        for offset in offsets {
            let expense = expenseArray[offset]
            
            if let index = expenses.items.firstIndex(of: expense) {
                expenseToRemove.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: expenseToRemove)
    } */
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
