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
import SVProgressHUD

protocol AddDelegate {
    func reciveInformationaAbout(adress : String ,latitude : CLLocationDegrees ,longitude : CLLocationDegrees, reminder : String , radius : Int)
}

class AddViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,CLLocationManagerDelegate,ReminderDelegate{

    

    //TODO: Declear your instant variable here :
    var delegate : AddDelegate?
    @IBOutlet weak var adressText: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    let pickerData = pickerdata()
    lazy var geocoder = CLGeocoder()
    var adress = ""
    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    let loctionManager = CLLocationManager()
    var radiusSelected = 0
    var reminder = ""
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //TODO: Declear your Delegate and dataSource here:
        pickerView.delegate = self
        pickerView.dataSource = self
        loctionManager.delegate = self
        
        //TODO: Dothe setup of the app here:
        loctionManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        loctionManager.requestAlwaysAuthorization()
        loading.isHidden = true
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
        radiusSelected = Int(pickerData.areaRange[row])!
    }
    
    //MARK:-  Buttons Clicked operations here :
    
    @IBAction func reminderClicked(_ sender: Any) {
        
        //TODO: Perform segue to the ReminderVC to get the reminder here:
        performSegue(withIdentifier: "goToReminder", sender: self)
    }
    @IBAction func useCurrentLocationClicked(_ sender: Any) {
        
        //TODO: Use the CoreLocation to get the current location here:
        loctionManager.startUpdatingLocation()
        adressText.isHidden = true
        loading.isHidden = false
        loading.startAnimating()
    }
    
    @IBAction func setLocationClicked(_ sender: UIButton) {
        //TODO: Use the locationPicker cocoaPod to let the user select prefered location  here:
        findLocation()
    }
    
    
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        if adress != ""{
            //TODO:  send data backword
            delegate?.reciveInformationaAbout(adress: adress, latitude: latitude, longitude: longitude, reminder: reminder , radius : radiusSelected)
           //TODO: Dismiss the VC
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK:- Getting the current location here :
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //TODO: Getting  user location
        let location = locations[locations.count - 1]
        
        if location.horizontalAccuracy > 0{
            loctionManager.stopUpdatingLocation()
            self.latitude =  location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            let location = CLLocation(latitude:self.latitude, longitude: self.longitude)

            // Geocode Location
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                // Process Response
                self.processResponse(withPlacemarks: placemarks, error: error)
                self.updateUi()
            }
            
        }
    }
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        //TODO: Getting address
        if let error = error {
            print("Unable to Reverse Geocode Location (\(error))")
            adress = "Unable to Reverse Geocode Location"
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                adress = placemark.compactAddress!
            } else {
                adress = "No Matching Addresses Found"
            }
        }
    }
    
    
    
    
    
    //MARK: - function to get the loctation when Button is pressed here :
    func findLocation(){
        let locationPicker = LocationPickerViewController()

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
    }
    
    func extractData(adress : String,coordinate : CLLocationCoordinate2D){
        //TODO: Function for extract data
        self.longitude = coordinate.longitude
        self.latitude = coordinate.latitude
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
        loading.isHidden = true
        loading.stopAnimating()
        adressText.isHidden = false
        if adress == ""{
            adressText.text = "Unable to Reverse Geocode Location"
        }else{
            adressText.text = adress
            print("\(self.longitude) \(self.latitude)")
        }
    }
}
