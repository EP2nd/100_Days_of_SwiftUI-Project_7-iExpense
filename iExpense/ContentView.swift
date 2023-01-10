//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Przeźwiecki Jr. on 09/01/2023.
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

/// Challenge 2:
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

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    /// Challenge 1:
    static let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        /// Challenge 1:
                        Text(item.amount, format: ContentView.localCurrency)
                        /// Challenge 2:
                            .fontColor(for: item.amount)
                    }
                }
                .onDelete(perform: removeItems)
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
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
