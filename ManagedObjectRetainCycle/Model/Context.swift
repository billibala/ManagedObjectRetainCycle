//
//  Context.swift
//  ManagedObjectRetainCycle
//
//  Created by Bill on 6/22/18.
//  Copyright © 2018 Headnix. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    private func fetchRandomProject() -> Project {
        let request: NSFetchRequest<Project> = Project.fetchRequest()
        let results = try! fetch(request)

        let randIdx = DataSeeder.faker.number.randomInt(min: 0, max: results.count - 1)

        return results[randIdx]
    }

    func transverseAProject() {
        let theProject = fetchRandomProject()
        print("Project: \(theProject.title)")

        theProject.todoLists?.forEach { todoList in
            guard let todoList = todoList as? TodoList else {
                return
            }

            print("Todo List: \(todoList.title)")

            todoList.todos?.forEach { todo in
                guard let todo = todo as? Todo else {
                    return
                }

                print("Todo: \(todo.title)")
            }
        }
    }
}
