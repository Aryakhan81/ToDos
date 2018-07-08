//
//  DisplayReminderViewController.swift
//  com.arya.gharib.todo
//
//  Created by Arya Gharib on 7/6/18.
//  Copyright © 2018 Arya Gharib. All rights reserved.
//

import Foundation
import UIKit

class DisplayReminderViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var contentText: UITextView!
    
    var reminder: Reminder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let reminder = reminder {
            nameText.text = reminder.name
            contentText.text = reminder.content
        } else {
            nameText.text = "Untitled"
            contentText.text = "Add a description of your reminder here..."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let destination = segue.destination as? ReminderTableViewController else { return }
        switch identifier {
        case "save" where reminder != nil:
            reminder?.name = nameText.text ?? ""
            reminder?.content = contentText.text ?? ""
            reminder?.modificationDate = Date()
            CoreDataHelper.saveReminder()
            
        case "save" where reminder == nil:
            let reminder = CoreDataHelper.newReminder()
            reminder.name = nameText.text ?? ""
            reminder.content = contentText.text ?? ""
            reminder.modificationDate = Date()
            CoreDataHelper.saveReminder()
            
        case "trash":
            CoreDataHelper.deleteReminder(reminder: reminder!)
        default:
            print("unexpected segue identifier")
        }
        destination.reminders = CoreDataHelper.retrieveReminders()
    }
    
    
}
