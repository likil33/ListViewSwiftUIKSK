//
//  ClickableRowList.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 12/02/22.
//

import SwiftUI




struct ClickableRowList: View {
    @State private var selectedIndx:Int?
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(0...10, id:\.self) { index in
                        HStack {
                            Text("\(index)")
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                            selectedIndx = index
                        })
                    }
                }
                selectedIndx.map {
                    Text("\($0)")
                        .font(.largeTitle)
                }
            }
        }
        
    }
}

struct ClickableRowList_Previews: PreviewProvider {
    static var previews: some View {
        ClickableRowList()
    }
}
