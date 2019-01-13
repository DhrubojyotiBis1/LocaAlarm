//
//  ViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit
import CoreLocation
import DLLocalNotifications

class ViewController: UIViewController,AddDelegate,UITableViewDelegate,UITableViewDataSource{
    
    //MARK:- Declear the instance varible here
    var alarm = [AlarmSaved]()
     @IBOutlet weak var tableView: UITableView!
    var adress = ""
    var longitude = CLLocationDegrees()
    var latitude = CLLocationDegrees()
    var reminder = ""
    var radius = 0
    //TODO: Array of object of AlarmSaved class
    
    //MARK:- Event functions here :
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO : Set the tableView dataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustumTableViewCell", bundle: nil), forCellReuseIdentifier: "CustumCell")
        
    }

  
    //MARK: - TableView functions here:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO:  numberOfRow function here :
        return alarm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustumCell", for: indexPath) as! CustumTableViewCell
        
        cell.adressText.text = alarm[indexPath.row].adress
        cell.reminder.text = alarm[indexPath.row].reminder
        return cell
    }
    
    
    
    //MARK: - Function to save data in the device here :
    
    //TODO: function to save the Alarm data in the device
    
    //MARK: - Opration to set notification here :
    
    func setNotification(){
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = CLCircularRegion(center: center, radius: CLLocationDistance(self.radius), identifier: "Headquarters")
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let locationNotification = DLNotification(identifier: "LocationNotification", alertTitle: "You have reached \(self.adress)", alertBody: self.reminder , region: region )
        
        let scheduler = DLNotificationScheduler()
        scheduler.scheduleNotification(notification: locationNotification)
    }
    
    
    //MARK: - Add and Edit buttons opration here :
    @IBAction func addpressed(_ sender: UIBarButtonItem) {
        //TODO: Segue to go to the AddVC
        performSegue(withIdentifier: "goToAlarm", sender: self)
    }
    
    @IBAction func editPressed(_ sender: UIBarButtonItem) {
    }
    
    //MARK: - prepare for segue to create the object of AddVC here :
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAlarm"{
            let alarm = segue.destination as! AddViewController
            alarm.delegate = self
        }
    }
    
    
    
    //MARK: - Protocol function here :
    
    
    func reciveInformationaAbout(adress: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees , reminder : String , radius : Int) {
     //TODO: Inside the protocol finction create an object of AlarmSaved and save the data in it and the append it to the array of AlarmSaved object
        //TODO: used for saving data and showing in tableView
        let alarm = AlarmSaved()
        alarm.reminder = reminder
        alarm.adress = adress
        alarm.latitude = latitude
        alarm.longitude = longitude
        alarm.radius = radius
        alarm.isSet = true
        self.alarm.append(alarm)
        //TODO: used for setting reminder
        self.reminder = reminder
        self.longitude = longitude
        self.latitude = latitude
        self.adress = adress
        self.radius = radius
        self.setNotification()
        tableView.reloadData()
    }
}

