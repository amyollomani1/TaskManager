//
//  TaskSection.swift
//  TaskManager
//
//  Created by Amy Ollomani on 12/24/23.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    
    case all
    case done
    case upcoming
    case list(TaskGroup)
    
    
    var id: String {
        switch(self) {
            case .all:
                return "all"
            case .done:
               return  "done"
            case .upcoming:
               return  "upcoming"
            case .list(let taskGroup):
               return taskGroup.id.uuidString
    
        }
        
    }
    
    var displayName: String {
        switch self {
            case .all:
                return "All"
            case .done:
                return "Done"
            case .upcoming:
               return  "Upcoming"
            case .list(let taskGroup):
                return taskGroup.title
        }
    }
    
    var iconName: String {
        switch self {
            case .all:
                return "star"
            case .done:
               return "checkmark.circle"
            case .upcoming:
                return "calendar"
            case .list(_):
                return "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
}
