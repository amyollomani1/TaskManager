//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Amy Ollomani on 12/23/23.
//

import SwiftUI

@main

struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //This is the top control panel
        .commands{
            CommandMenu("Task"){
                Button("Add new Task"){
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem){
                Button("Add new Group"){
                    
                }
            }
        }
    }
}
