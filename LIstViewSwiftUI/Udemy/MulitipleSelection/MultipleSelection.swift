//
//  MultipleSelection.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 12/02/22.
//

import SwiftUI

struct Customer: Identifiable {
    let id = UUID()
    let name:String
}

struct MultipleSelection: View {
    
    @State private var employList = [Customer(name: "santhosh"),Customer(name: "kumar"),Customer(name: "koneti"),Customer(name: "madhuri"),Customer(name: "konetiSanthosh"),Customer(name: "konetiMadhuri")]
    
    @State private var selectedEmployList = Set<UUID>()
    
    var body: some View {
        NavigationView {
            List(employList, selection:$selectedEmployList) { emp in
                HStack {
                    Text("\(emp.name)")
                    Spacer()
                }
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Selected \(self.selectedEmployList.count)")
        }
    }
}

struct MultipleSelection_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelection()
    }
}
