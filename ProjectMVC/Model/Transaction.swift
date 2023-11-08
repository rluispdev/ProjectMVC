//
//  Transaction.swift
//  ProjectMVC
//
//  Created by Rafael Gonzaga on 07/11/23.
//

import Foundation

struct Transaction: Identifiable, Codable {
    let id = UUID()
    let amount: Int
    let beneficuary: String
    let date: Date
}
