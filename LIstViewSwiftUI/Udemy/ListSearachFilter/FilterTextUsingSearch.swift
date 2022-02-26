//
//  FilterTextUsingSearch.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 12/02/22.
//

import SwiftUI

struct Place:Identifiable {
    let id = UUID()
    let name:String
    let image:String
}

func getPlaces() -> [Place] {
    let placess = [Place(name: "santhosh", image: "average-dev"),
                   Place(name: "Kumar", image: "beginner-tableView"),
                   Place(name: "Madhu", image: "first-job"),
                   Place(name: "Koneti", image: "sample"),
                   Place(name: "Jakkam", image: "xcode-12")]
    
    return placess
}


struct FilterTextUsingSearch: View {
    
    @State private var search:String = ""
    @State private var places = getPlaces()
    @State private var selectedIndex:Int?
    
    
    var body: some View {
        NavigationView {
            List(places) { place in
                HStack(alignment: .top){
                    Image(place.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    Text(place.name)
                        .font(.title)
                }
                .swipeActions(edge: .leading) {
                    Button {
                        //Action
                    } label: {
                        Label("Heart", systemImage: "heart.circle")
                    }.tint(.yellow)
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        //Action
                    } label: {
                        Label("Heart", systemImage: "heart.circle")
                    }.tint(.red)
                }
            }
            .listStyle(.plain)
            .searchable(text: $search)
            .onChange(of: search, perform: { value in
                if !value.isEmpty && value.count >= 1 {
                    places =  places.filter {
                        $0.name.lowercased().hasPrefix(value.lowercased())
                    }
                }
                else {
                    places = getPlaces()
                }
            })
            
            .navigationTitle("Places")
        }
    }
}

struct FilterTextUsingSearch_Previews: PreviewProvider {
    static var previews: some View {
        FilterTextUsingSearch()
    }
}
