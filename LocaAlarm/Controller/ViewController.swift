//
//  ViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    //MARK:- Declear the instance varible here
    //TODO: Array of object of AlarmSaved class
    
    //MARK:- Event functions here :
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO : Set the tableView dataSource and delegate 
    }

  
    //MARK: - TableView functions here:
    
    //TODO:  cellForRowIndexPath function here :
    
    
    //TODO:  numberOfRow function here :
    
    
    
    //MARK: - Function to save data in the device here :
    
    //TODO: function to save the Alarm data in the device 
    
    
    //MARK: - Add and Edit buttons opration here :
    @IBAction func addpressed(_ sender: UIBarButtonItem) {
        //TODO: Segue to go to the AddVC
        performSegue(withIdentifier: "goToAlarm", sender: self)
    }
    
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
    }
    
    
    
    //MARK: - Protocol to get the data passed from AddVC here :
    
    //TODO: Inside the protocol finction create an object of AlarmSaved and save the data in it and the append it to the array of AlarmSaved object
    
    
    
}

