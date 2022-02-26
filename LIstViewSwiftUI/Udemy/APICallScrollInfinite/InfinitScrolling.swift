//
//  InfinitScrolling.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 26/02/22.
//

import SwiftUI

struct InfinitScrolling: View {
    
    @StateObject private var numberListVM =  NumberListViewModel()
    @State private var currentPage :Int = 1
    
    var body: some View {
        List(numberListVM.numbers, id:\.self) { number in
            Text("\(number)")
                .onAppear(perform: {
                    if numberListVM.shouldLoadData(id: number) {
                        currentPage += 1
                        numberListVM.populatedData(page: currentPage)
                    }
                })
        }.onAppear(perform: {
            numberListVM.populatedData(page: currentPage)
        })
    }
}

struct InfinitScrolling_Previews: PreviewProvider {
    static var previews: some View {
        InfinitScrolling()
    }
}
