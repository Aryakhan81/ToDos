//
//  CoreDataHelper.swift
//  com.arya.gharib.todo
//
//  Created by Arya Gharib on 7/7/18.
//  Copyright © 2018 Arya Gharib. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newReminder() -> Reminder {
        let reminder = NSEntityDescription.insertNewObject(forEntityName: "Reminder", into: context) as! Reminder
        return reminder
    }
    
    static func saveReminder(){
        do {
            try context.save()
        } catch let error {
            print("An error occured trying to save \(error.localizedDescription)")
        }
    }
    
    static func deleteReminder(reminder: Reminder) {
        context.delete(reminder)
        saveReminder()
    }
    
    static func retrieveReminders() -> [Reminder] {
        do {
            let fetchRequest = NSFetchRequest<Reminder>(entityName: "Reminder")
            let results = try context.fetch(fetchRequest)
            return results
        } catch let error {
            print("An error occured trying to fetch \(error.localizedDescription)")
            return []
        }
    }
    
}
