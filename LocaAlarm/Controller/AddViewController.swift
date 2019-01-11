//
//  AddViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("AddViewController")
        performSegue(withIdentifier: "goToReminder", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
