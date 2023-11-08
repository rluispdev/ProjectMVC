//
//  StorageController.swift
//  ProjectMVC
//
//  Created by Rafael Gonzaga on 07/11/23.
//

import Foundation

class StorageController {
    private let documentsDirectoryURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
    
    private var accountsFileURL: URL {
        return documentsDirectoryURL
            .appendingPathComponent("Accounts")
            .appendingPathExtension("json")
    }
    
    func save(_ accounts: [Account]) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(accounts) else {return}
        try? data.write(to: accountsFileURL)
    }
    
    func fechAccounts() -> [Account] {
        guard let data = try? Data(contentsOf: accountsFileURL) else { return []}
        let decoder = JSONDecoder()
        let accounts = try? decoder.decode([Account].self, from: data)
        return accounts ?? []
    }
}
