//
//  NumbersListViewModel.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 26/02/22.
//

import SwiftUI


class NumberListViewModel: ObservableObject {
    
    @Published var numbers:[Int] = []
    
    func populatedData(page:Int) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/data?page=\(page)") else {return}
        URLSession.shared.dataTask(with: url) { Resdata, response, error in
            guard let data = Resdata, error == nil else {return}
            let numbers = try? JSONDecoder().decode([Int].self, from: data)
            DispatchQueue.main.async {
                //self.numbers = numbers ?? []
                print(numbers)
                self.numbers.append(contentsOf: numbers ?? [Int]())
            }
        }.resume()
    }
    
    func shouldLoadData(id:Int) -> Bool {
        return id == numbers.count - 1
    }
    
}
