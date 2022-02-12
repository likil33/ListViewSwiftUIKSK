//
//  ListCURDOperation.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 08/02/22.
//

import SwiftUI

struct ListCURDOperation: View {
    
    @State var friends:[String] = ["santhosh","Madhuri","santhoshKumar","Madhu","koneti"]
    
    private func deleteCell(indexsetV:IndexSet) {
        //1
        self.friends.remove(atOffsets: indexsetV)
        
        //2
        /*
        indset.forEach { idx in
            friends.remove(at: idx)
        }
        */
    }
    
    private func moveCell(indexsetV:IndexSet, newIndex:Int) {
        self.friends.move(fromOffsets: indexsetV, toOffset: newIndex)
    }
    
    private func addCell() {
        self.friends.append("koneti madhuri")
    }
    
    var addView: some View {
        Button("Add",action: {
            addCell()
        })
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(
                    header:
                       HStack {
                          Text("Friends")
                          Image(systemName: "flame.fill")
                       }
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        
                ) {
                    ForEach(friends, id:\.self) { friend in
                        Text(friend)
                            .foregroundColor(.white)
                    }
                    .onDelete(perform: deleteCell)
                    .onMove(perform: moveCell)
                    .listRowBackground(Color.blue)
                }
                
                Section(
                    header: Text("Best Friends")) {
                    ForEach(friends, id:\.self) { friend in
                        Text(friend)
                    }
                    .onDelete(perform: deleteCell)
                    .onMove(perform: moveCell)
                }
            }
            .navigationTitle("Lovely friends")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addView )
            
        }
    }
}

struct ListCURDOperation_Previews: PreviewProvider {
    static var previews: some View {
        ListCURDOperation()
    }
}
