//
//  PullToRefresh.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 12/02/22.
//

import SwiftUI

struct PullToRefresh: View {
    
    @State private var refreshDates:[Date] = []
    
    var body: some View {
        NavigationView {
            List(refreshDates, id:\.self) { date in
                Text("\(date)")
            }
            .listStyle(.plain)
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    let currentDate = Date()
                    refreshDates.append(currentDate)
                }
            }
   
            .navigationTitle("Pull to refresh")
        }
    }
}

struct PullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefresh()
    }
}
