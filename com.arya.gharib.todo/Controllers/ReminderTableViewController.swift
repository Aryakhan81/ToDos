//
//  ReminderTableViewController.swift
//  com.arya.gharib.todo
//
//  Created by Arya Gharib on 7/6/18.
//  Copyright © 2018 Arya Gharib. All rights reserved.
//

import Foundation
import UIKit

class ReminderTableViewController: UITableViewController, ReminderTableViewCellDelegate {
    
    var reminders = [Reminder](){
        didSet{
            tableView.reloadData()
        }
    }
    
    func tappedComplete(_ sender: ReminderTableViewCell) {
        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
        let reminder = reminders[tappedIndexPath.row]
        CoreDataHelper.deleteReminder(reminder: reminder)
        reminders = CoreDataHelper.retrieveReminders()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reminders = CoreDataHelper.retrieveReminders()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderTableViewCell", for: indexPath) as! ReminderTableViewCell        
        let reminder = reminders[indexPath.row]
        cell.reminderTitle.text = reminder.name
        cell.reminderTime.text = reminder.modificationDate?.description ?? "unknown"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let reminderToDelete = reminders[indexPath.row]
            CoreDataHelper.deleteReminder(reminder: reminderToDelete)
            reminders = CoreDataHelper.retrieveReminders()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "editReminder":
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let reminder = reminders[indexPath.row]
            let destination = segue.destination as! DisplayReminderViewController
            destination.reminder = reminder
            
        case "addReminder":
            print("Reminder created")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }


}

