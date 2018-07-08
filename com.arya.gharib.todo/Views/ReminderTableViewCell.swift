//
//  ReminderTableViewCell.swift
//  com.arya.gharib.todo
//
//  Created by Arya Gharib on 7/6/18.
//  Copyright © 2018 Arya Gharib. All rights reserved.
//

import Foundation
import UIKit

class ReminderTableViewCell: UITableViewCell {
    //Button action
    var onButtonTouched: ((ReminderTableViewCell) -> Void)? = nil
    @IBAction func completeButtonTapped(_ sender: Any) {
        
    }
    
    //Labels on the cell
    @IBOutlet weak var reminderTitle: UILabel!
    @IBOutlet weak var reminderTime: UILabel!
    
}
