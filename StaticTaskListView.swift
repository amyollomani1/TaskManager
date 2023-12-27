//
//  TaskListView.swift
//  TaskManager
//
//  Created by Amy Ollomani on 12/24/23.
//

import SwiftUI

struct StaticTaskListView: View {
    
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks){task in
            HStack{
                Image(systemName: task.isCompleted ?
                      "largecircle.fill.circle": "circle")
                Text(task.title)
                
            }
            
        }
    }
}


struct StaticTaskListView_Previews: PreviewProvider {
    //SwiftUI(title: "All", tasks: Task.examples())
   static var previews: some View {
       StaticTaskListView(title: "All", tasks: Task.examples())
   }
}
