//
//  CheckBoxList.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 26/02/22.
//

import SwiftUI

struct CheckBoxList: View {
    
    @State private var selectedCities:[String] = []
    let cities = ["Hyderbad", "Mumbai", "Bangalore","Gujarath","Odhisa"]
    
    var body: some View {
        VStack {
            List(cities, id: \.self) { city in
                HStack {
                    Text(city)
                    Spacer()
                
                    ZStack {
                        if selectedCities.contains(city) {
                            Image(systemName: "checkmark.square.fill")
                                .font(.largeTitle)
                        }
                        else {
                            Image(systemName: "square")
                                .font(.largeTitle)
                        }

                    }
                    .foregroundColor(.blue)
                    onTapGesture {
                        if selectedCities.contains(city) {
                            selectedCities = selectedCities.filter {$0 != city}
                        }
                        else {
                            selectedCities.append(city)
                        }
                    }

                }
            }
            
            Text("selecte cities")
            List(selectedCities, id:\.self) { sCity in
                Text(sCity)
            }
        }
    }
}

struct CheckBoxList_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxList()
    }
}
