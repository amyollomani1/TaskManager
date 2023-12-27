//
//  TaskListView.swift
//  TaskManager
//
//  Created by Amy Ollomani on 12/24/23.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    @Binding var tasks: [Task]
    @State private var selectedTask: Task? = nil
    
    @State private var isShowingInspector: Bool = false
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task,
                     selectedTask: $selectedTask,
                     isShowingInspector: $isShowingInspector)
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItemGroup {
                Button {
                    tasks.append(Task(title: "New Task"))
                } label: {
                    Label("Add New Task", systemImage: "plus")
                }
                
                Button {
                    isShowingInspector.toggle()
                } label: {
                    Label("Show inspector", systemImage: "sidebar.right")
                }
            }
            
        }
     
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(title: "All", tasks: .constant(Task.examples()))
    }
}


