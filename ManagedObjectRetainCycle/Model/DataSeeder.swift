//
//  DataSeeder.swift
//  ManagedObjectRetainCycle
//
//  Created by Bill on 6/21/18.
//  Copyright © 2018 Headnix. All rights reserved.
//

import Foundation
import CoreData
import Fakery

struct DataSeeder {
    static let faker = Faker()

    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func seedDatabase() {
        context.performAndWait {
            for _ in 0..<16 {
                let aProject = Project.random(context: self.context)

                let numOfList = DataSeeder.faker.number.randomInt(min: 8, max: 16)
                for _ in 0..<numOfList {
                    let aTodoList = TodoList.random(context: self.context)
                    aProject.addToTodoLists(aTodoList)

                    let numOfItem = DataSeeder.faker.number.randomInt(min: 8, max: 24)
                    for _ in 0..<numOfItem {
                        let aTodo = Todo.random(context: self.context)
                        aTodoList.addToTodos(aTodo)
                    }
                }
            }

            try! self.context.save()
        }
    }
}

extension Todo {
    static func random(context: NSManagedObjectContext) -> Todo {
        let todo = Todo(context: context)
        todo.completed = DataSeeder.faker.number.randomBool()
        todo.title = DataSeeder.faker.commerce.productName()
        return todo
    }
}

extension TodoList {
    static func random(context: NSManagedObjectContext) -> TodoList {
        let todoList = TodoList(context: context)
        todoList.title = DataSeeder.faker.company.name()
        return todoList
    }
}

extension Project {
    static func random(context: NSManagedObjectContext) -> Project {
        let project = Project(context: context)
        project.title = DataSeeder.faker.company.name()
        return project
    }
}
