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
    
    //Objects on the cell
    @IBOutlet weak var reminderTitle: UILabel!
    @IBOutlet weak var reminderTime: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    weak var delegate: ReminderTableViewCellDelegate?
    
    @IBAction func tappedComplete(_ sender: UIButton) {
    }
}
