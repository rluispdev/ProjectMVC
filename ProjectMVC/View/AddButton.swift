//
//  AddButton.swift
//  ProjectMVC
//
//  Created by Rafael Gonzaga on 08/11/23.
//

import SwiftUI

struct AddButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
       HStack {
            Spacer()
            Button(action: action ) {
                    Image(systemName: "plus.circle.fill")
                    Text(title)
                    .font(.headline)
            }
            .padding(.trailing, 20.0)
        }
    
    }
}
#Preview {
    VStack {
        Spacer()
        AddButton(title: "Add item", action: {})
    }
}
