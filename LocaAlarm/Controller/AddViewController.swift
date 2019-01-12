//
//  AddViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit
import LocationPicker
import CoreLocation

class AddViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,CLLocationManagerDelegate,ReminderDelegate{

    

    //TODO: Declear your instant variable here :
    @IBOutlet weak var adressText: UILabel!
    let pickerData = pickerdata()
    var coordinate : CLLocationCoordinate2D?
    var adress = ""
    let loctionManager = CLLocationManager()
    let locationPicker = LocationPickerViewController()
    var reminder = ""
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Declear your Delegate and dataSource here:
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    //MARK:-  pickerView operation here :
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.areaRange.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData.areaRange[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    //MARK:-  Buttons Clicked operations here :
    
    @IBAction func reminderClicked(_ sender: Any) {
        
        //TODO: Perform segue to the ReminderVC to get the reminder here:
        performSegue(withIdentifier: "goToReminder", sender: self)
    }
    @IBAction func useCurrentLocationClicked(_ sender: Any) {
        
        //TODO: Use the locationPicker cocoaPod to get the current location here:
        
    }
    
    @IBAction func setLocationClicked(_ sender: UIButton) {
        //TODO: Use the locationPicker cocoaPod to let the user select prefered location  here:
        findLocation(tag: sender.tag)
    }
    
    
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        //TODO: perform segue to go to ViewController and send data backword
        //TODO: Dismiss the VC
    }
    
    //MARK: - function to get the loctation when Button is pressed here :
    func findLocation(tag :  Int){
        if tag == 1{
            //TODO: Getting the location
            
            // button placed on right bottom corner
            locationPicker.showCurrentLocationButton = true // default: true
            
            // default: navigation bar's `barTintColor` or `.whiteColor()`
            locationPicker.currentLocationButtonBackground = .orange
            
            // ignored if initial location is given, shows that location instead
            locationPicker.showCurrentLocationInitially = true // default: true
            
            locationPicker.mapType = .standard // default: .Hybrid
            
            // for searching, see `MKLocalSearchRequest`'s `region` property
            locationPicker.useCurrentLocationAsHint = true // default: false
            
            locationPicker.searchBarPlaceholder = "Search places" // default: "Search or enter an address"
            
            locationPicker.searchHistoryLabel = "Previously searched" // default: "Search History"
            
            // optional region distance to be used for creation region when user selects place from search results
            locationPicker.resultRegionDistance = 500 // default: 600
            
            locationPicker.completion = { location in
                // do some awesome stuff with location
                self.extractData(adress: (location?.address)!, coordinate: (location?.coordinate)!)
            }
            
            navigationController?.pushViewController(locationPicker, animated: true)
        }else{
            
            
            
        }
    }
    
    //TODO: Function for extract data
    func extractData(adress : String,coordinate : CLLocationCoordinate2D){
        self.coordinate = coordinate
        self.adress = adress
        updateUi()
    }
    
    
     // MARK: - Get reminder from the ReminderVC here :
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToReminder"{
            
            let reminderVC = segue.destination as! ReminderViewController
            reminderVC.delegate = self
        }
    }
    
    func text(reminder: String) {
        self.reminder = reminder
    }
    
    //MARK: - update UI
    func updateUi(){
        //TODO: Update the UI in the addVC
        adressText.text = adress
    }
}
