//
//  TestData.swift
//  ProjectMVC
//
//  Created by Rafael Gonzaga on 08/11/23.
//

import Foundation

struct TesData {
    static let account = Account(name: "Test account", iban: String.generateIban(), kind: .cheking)
  
    static let transaction = Transaction(amount: 123456, beneficiary: "Salary", date: Date())
}
