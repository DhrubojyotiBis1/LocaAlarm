//
//  ViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    //TODO : Declear the instance varible here

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO : Set the tableView dataSource and delegate 
    }

  
    //MARK: - TableView functions here:
    
    
    
    //MARK: - Add and Edit buttons opration here :
    @IBAction func addpressed(_ sender: UIBarButtonItem) {
        //TODO: Segue to go to the AddVC
        performSegue(withIdentifier: "goToAlarm", sender: self)
    }
    
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
    }
    
    
    
    //MARK: - Protocol to get the data passed from AddVC here :
    
    
}

