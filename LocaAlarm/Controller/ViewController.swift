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
        cell.onOffSwitch.accessibilityIdentifier = alarm[indexPath.row].identifire
        cell.adressText.text = alarm[indexPath.row].adress
        cell.reminder.text = alarm[indexPath.row].reminder
        cell.onOffSwitch.accessibilityIdentifier = alarm[indexPath.row].identifire
        return cell
    }
    
    
    
    //MARK: - Function to save data in the device here :
    
    //TODO: function to save the Alarm data in the device
    
    //MARK: - Opration to set notification here :
    
    func setNotification(identifire : Int){
        let center = CLLocationCoordinate2D(latitude: self.alarm[identifire].latitude, longitude: self.alarm[identifire].longitude)
        let region = CLCircularRegion(center: center, radius: CLLocationDistance(self.alarm[identifire].radius), identifier: "Headquarters")
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let locationNotification = DLNotification(identifier: "\(identifire)" , alertTitle: "You have reached \(self.alarm[identifire].adress)", alertBody: self.alarm[identifire].reminder , region: region )
        
        let scheduler = DLNotificationScheduler()
        alarm[identifire].identifire = scheduler.scheduleNotification(notification: locationNotification)!
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
        self.alarm.append(alarm)
        self.setNotification(identifire: (self.alarm.count  - 1 ))
        tableView.reloadData()
    }
}

