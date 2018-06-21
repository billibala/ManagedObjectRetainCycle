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
}

