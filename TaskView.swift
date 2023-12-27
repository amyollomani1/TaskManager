//
//  TaskView.swift
//  TaskManager
//
//  Created by Amy Ollomani on 12/24/23.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
        @Binding var selectedTask: Task?
        @Binding var isShowingInspector: Bool
        
        var body: some View {
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                    .onTapGesture {
                        task.isCompleted.toggle()
                    }
                
                TextField("New Task", text: $task.title)
                    .textFieldStyle(.plain)
                
                Button(action: {
                    isShowingInspector = true
                    selectedTask = task
                }, label: {
                    Text("Details")
                })
            }
        }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: .constant(Task.example()), selectedTask: .constant(nil), isShowingInspector: .constant(false))
            .padding()
    }
}
