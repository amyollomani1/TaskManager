//
//  SwiftUIView.swift
//  TaskManager
//
//  Created by Amy Ollomani on 12/24/23.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection?

    var body: some View{
        List(selection: $selection){
            Section("Tasks"){
                ForEach(TaskSection.allCases){ selection in
                    Label(selection.displayName,
                          systemImage: selection.iconName)
                    .tag(selection)
                }
            }
            Section("Categories"){
                ForEach($userCreatedGroups){ $group in
                    HStack{
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title )
                    }
                    .tag(TaskSection.list(group))
                    .contextMenu{
                        Button("Delete", role: .destructive){
                            if let index = userCreatedGroups.firstIndex(where: { $0.id == group.id}){
                                userCreatedGroups.remove(at: index)
                            }
                        }
                        Text("Menu Item 1")
                        Text("Menu Item 2")
                        Text("Menu Item 3")
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom){
            Button(action: {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
    }
        
}


struct SidebarView_Previews: PreviewProvider {
    //SwiftUI(title: "All", tasks: Task.examples())
   static var previews: some View {
       SidebarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
           .listStyle(.sidebar)
   }
}
