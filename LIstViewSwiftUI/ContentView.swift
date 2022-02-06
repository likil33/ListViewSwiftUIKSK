//
//  ContentView.swift
//  LIstViewSwiftUI
//
//  Created by Santhosh K on 05/02/22.
//

import SwiftUI





//Number display

/*
struct ContentView: View {

    var body: some View {
        List(1...20, id:\.self) { index in
            Text("\(index)")
        }
    }
}
*/


//Names Display
/*
 
 struct Friend:Identifiable {
     let id = UUID()
     let name :String
 }
 
struct ContentView: View {
    let friends = [
        Friend(name: "santhosh"),
        Friend(name: "Kumar"),
        Friend(name: "Koneti"),
        Friend(name: "Madhuri"),
        Friend(name: "santhoshKumar"),
        Friend(name: "Konetisanthoshkumar")]
    
    var body: some View {
        List(friends.indices) { index in
            let friend = friends[index]
            HStack {
                Text("\(index)")
                    .font(.title)
                Text(friend.name)
                    .font(.title)
                Spacer()
            }.background(index % 2 == 0 ? Color.green:Color.blue)
        }
    }
}
*/



//Adding and removing and moving items in list
//
//struct ContentView:View {
//
//    @State private var taskName:String = ""
//    @State private var allTasks:[String] = []
//
//    private func deleteTask(indexSet:IndexSet) {
//        indexSet.forEach { index in
//            allTasks.remove(at: index)
//        }
//    }
//
//
//    private func moveTask(from soure:IndexSet, to destination: Int) {
//        allTasks.move(fromOffsets: soure, toOffset: destination)
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    TextField("Enter task name", text: $taskName)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Button("Add Task") {
//                        allTasks.append(taskName)
//                        taskName = ""
//                    }
//                }
//                List {
//                    ForEach(allTasks, id:\.self) { task in
//                        Text(task)
//                    }.onDelete(perform: deleteTask)
//                        .onMove(perform: moveTask)
//                }.listStyle(PlainListStyle())
//                    .toolbar {
//                        EditButton()
//                    }
//
//            }.padding()
//        }
//    }
//}



// Group items in list: like section and cells

/*
struct Post: Identifiable {
    let id = UUID()
    let title:String
    let commentsList:[Comment]
}

struct Comment:Identifiable {
    let id = UUID()
    let title:String
}


struct ContentView :View {

    let posts = [
        Post(title: "Post #1", commentsList: [Comment(title: "comment 1 for post #1"), Comment(title: "comment 2 for post #1")]),
        Post(title: "Post #2", commentsList: [Comment(title: "comment 1 for post #2"), Comment(title: "comment 2 for post #2")]),
    ]
    
    var body: some View {
        List {
            ForEach(posts) { post in
                Section(header:Text(post.title)) {
                    ForEach(post.commentsList) { comment in
                        Text(comment.title)
                    }
                }
            }
        }
    }
}
*/


//Scroll with background color change in list
struct ContentView:View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...20, id:\.self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(index)")
                            Divider()
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Color.green)
        }.background(Color.red)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
