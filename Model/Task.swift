//
//  Task.swift
//  TaskManager
//
//  Created by Amy Ollomani on 12/23/23.
//

import Foundation

struct Task: Identifiable, Hashable{
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var details: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil){
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.details = details
    }
    static func example() ->Task{
        Task(title: "Buy milk", dueDate: Calendar.current.date(byAdding: .day, value:2, to: Date())!);
    }
    static func date(dayspassed: Int)->Date{
        Calendar.current.date(byAdding: .day, value: dayspassed, to:Date())!;
        
    }
    static func examples()-> [Task]{
        [
        Task(title:"Finish calc HW"),
        Task(title: "Reply to email", isCompleted : true),
        Task(title: "Send Application", isCompleted : false, dueDate: date(dayspassed: 3)),
        Task(title: "Reply to email to professor", isCompleted : false),
        Task(title: "Buy Gift", isCompleted : false, dueDate: date(dayspassed: 5))
        ]
        
    }
    
}
