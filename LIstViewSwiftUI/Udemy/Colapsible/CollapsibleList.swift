//
//  CollapsibleList.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 26/02/22.
//

import SwiftUI

struct StudentList:Identifiable {
    let id = UUID()
    let name:String
    let details:[StudentDetails]
}

struct StudentDetails:Identifiable {
    let id = UUID()
    let places:String
    let RollNumber:Int
    let gender:String
}

private func getAllStudentList() -> [StudentList] {
    let studentData = [StudentList(name: "santhosh", details: [StudentDetails(places: "india", RollNumber: 1, gender: "Male")]), StudentList(name: "madhuri", details: [StudentDetails(places: "US", RollNumber: 2, gender: "Female")]) ]
    
    return studentData
}

struct CollapsibleList: View {
    
    @State private var studentInfo = getAllStudentList()
    @State private var selectedName:String?
    @State private var expand:Bool = false
    
    var body: some View {
        List(studentInfo) { student in
            VStack (alignment:.leading){
                HStack {
                    Text(student.name)
                        .fontWeight(.bold)
                        .padding(.bottom,10)
                    Spacer()
                    Image(systemName: (selectedName == student.name) ? "chevron.down" : "chevron.right")
                }
                .contentShape(Rectangle())
                .onTapGesture(perform: {
                    expand.toggle()
                    selectedName = expand ? student.name : nil
                })
                
                if selectedName == student.name {
                    ForEach(student.details) { sDetails in
                        Text("\(sDetails.places)")
                    }
                }

            }
        }
    }
}

struct CollapsibleList_Previews: PreviewProvider {
    static var previews: some View {
        CollapsibleList()
    }
}
