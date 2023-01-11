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
                Section {
                    ForEach(expenses.items.filter { $0.type == "Business" }) { item in
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
                    .onDelete(perform: removeBusinessExpense)
                } header: {
                    Text("Business")
                }
                
                /// Challenge 3:
                Section {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
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
                    .onDelete(perform: removePersonalExpense)
                } header: {
                    Text("Personal")
                }
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
    
    /// Challenge 3:
    func removeBusinessExpense(at offsets: IndexSet) {
        let businessExpenses = expenses.items.filter { $0.type == "Business" }
        for offset in offsets {
            let sectionExpense = businessExpenses[offset]
            let expenseID = sectionExpense.id
            expenses.items.removeAll(where: { $0.id == expenseID })
        }
    }
    
    func removePersonalExpense(at offsets: IndexSet) {
        let personalExpenses = expenses.items.filter { $0.type == "Personal" }
        for offset in offsets {
            let sectionExpense = personalExpenses[offset]
            let expenseID = sectionExpense.id
            expenses.items.removeAll(where: { $0.id == expenseID })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
