//
//  AccountsView.swift
//  ProjectMVC
//
//  Created by Rafael Gonzaga on 08/11/23.
//

import SwiftUI

struct AccountsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
//MARK: -  Content

extension AccountsView {
    struct Content: View {
        @Binding var accounts: [Account]
        let newAccount: () -> Void
        
        var body: some View {
            VStack {
                List {
                    ForEach(accounts) { account in
                        NavigationLink(destination: Text("🤭")) {
                            
                        }
                    }
                    .onMove(perform: move(fromOffsets:toOffset:))
                }
                AddButton(title: "New Account", action: newAccount)
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
        
        func move(fromOffsets source: IndexSet, toOffset destination: Int) {
            accounts.move(fromOffsets: source, toOffset: destination)
        }
    }
}

//MARK: - Row

 




#Preview {
    AccountsView()
}
