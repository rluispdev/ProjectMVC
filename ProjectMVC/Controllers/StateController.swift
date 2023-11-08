//
//  StateController.swift
//  ProjectMVC
//
//  Created by Rafael Gonzaga on 07/11/23.
//

import Foundation

class StateController: ObservableObject {
    
    @Published var accounts: [Account]
    
    private let storageController = StorageController()
    
    init( ) {
        self.accounts = storageController.fechAccounts()
    }
    
    func addAccount(named name: String, withKind kind: Account.Kind) {
        let account = Account(name: name, iban: String.generateIban(), kind: kind)
        accounts.append(account)
        storageController.save(accounts)
    }
    
    func addTransaction(withAmount amount: Int, beneficiary: String, to account: Account) {
        guard let index = accounts.firstIndex(where: {$0.id == account.id }) else {return }
        let transactions = Transaction(amount: amount, beneficiary: beneficiary, date: Date())
        storageController.save(accounts)
    }
}
 
extension String {
    static func generateIban() ->  String {
        func randomString(lenght: Int, from characters: String) -> String {
            String((0..<lenght).map { _ in characters.randomElement()! })
        }
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let digits = "0123456789"
        return randomString(lenght: 2, from: letters)
        + randomString(lenght: 2, from: digits)
        + randomString(lenght: 4, from: letters)
        + randomString(lenght: 12, from: digits)
    }
}
