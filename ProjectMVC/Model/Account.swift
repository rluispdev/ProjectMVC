//
//  Account.swift
//  ProjectMVC
//
//  Created by Rafael Gonzaga on 07/11/23.
//

import Foundation

struct Account: Codable, Identifiable {
    let name: String
    let iban: String
    let kind: Kind
    private(set) var transactions: [Transaction]
    
    var id: String {iban}
    
    var balance: Int {
        var balance = 0
        for transaction in transactions {
            balance += transaction.amount
        }
         return balance
    }
    
    init(name: String, iban: String, kind: Kind) {
        self.name = name
        self.kind = kind
        self.iban = iban
    transactions = [Transaction(amount: 2000_00, beneficuary: "Inicial Balance", date: Date())]
    }
    
    mutating func add(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}
extension Account {
    enum Kind: String, Codable, CaseIterable {
        case cheking
        case savings
        case investment
    }
}
