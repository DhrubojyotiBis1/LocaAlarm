//
//  ViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addpressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAlarm", sender: self)
    }
    
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
    }
}

