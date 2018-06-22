//
//  ViewController.swift
//  ManagedObjectRetainCycle
//
//  Created by Bill on 6/20/18.
//  Copyright © 2018 Headnix. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var persistentContainer: NSPersistentContainer {
        let theDelegate = NSApp.delegate as! AppDelegate
        return theDelegate.persistentContainer
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func handleShowSomething(_ sender: Any) {
        print("Is todo list retained?")
        dump(retainedTodoList)

        print("Is todo retained?")
        dump(retainedTodo)
    }

    @IBAction func handleSeedDataClick(_ sender: Any) {
        let seeder = DataSeeder(context: persistentContainer.newBackgroundContext())
        seeder.seedDatabase()
    }

    @IBAction func handleTransverseAProject(_ sender: Any) {
        let viewContext = persistentContainer.viewContext
        viewContext.performAndWait {
            viewContext.transverseAProject()
        }
    }

    @IBAction func handleTransverseAndInvokeParent(_ sender: Any) {
        let viewContext = persistentContainer.viewContext
        viewContext.performAndWait {
            viewContext.transverseAProjectAndInvokeParent()
        }
    }

    @IBAction func handleTransverseAndRefreshTodoList(_ sender: Any) {
        let viewContext = persistentContainer.viewContext
        viewContext.performAndWait {
            viewContext.transverseAProjectAndRefreshAllTodoLists()
        }
    }

    @IBAction func handleTransverseAndRefreshAllTodos(_ sender: Any) {
        let viewContext = persistentContainer.viewContext
        viewContext.performAndWait {
            viewContext.transverseAProjectAndRefreshAllTodos()
        }
    }
}

