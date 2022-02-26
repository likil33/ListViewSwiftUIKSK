//
//  AutoScrollToRowInList.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 12/02/22.
//

import SwiftUI

struct AutoScrollToRowInList: View {
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                VStack {
                    Button("Scroll To Row Value") {
                        withAnimation {
                            proxy.scrollTo(215)
                        }
                    }
                    List(0...500, id:\.self) { index in
                        Text("\(index)")
                            .id(index)
                    }
                }
            }
        }
    }
}

struct AutoScrollToRowInList_Previews: PreviewProvider {
    static var previews: some View {
        AutoScrollToRowInList()
    }
}
