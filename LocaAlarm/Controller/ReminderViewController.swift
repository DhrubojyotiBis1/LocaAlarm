//
//  ReminderViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

protocol ReminderDelegate {
    func text(reminder : String)
}
class ReminderViewController: UIViewController {

    //TODO: Delegate here:
    var delegate : ReminderDelegate?
    //TODO: Create the instance variable here:

    @IBOutlet weak var reminderText: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("ReminderViewController")
    }
    
    //MARK: - Save button pressed opration here :
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        //TODO: distroy the view add send the reminder to the AddVC
        delegate?.text(reminder: reminderText.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
