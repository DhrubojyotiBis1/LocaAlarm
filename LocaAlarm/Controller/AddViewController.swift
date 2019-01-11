//
//  AddViewController.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 11/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class AddViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{

    
    //Declear your instant variable here :
    let pickerData = pickerdata()
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Declear your Delegate and dataSource here:
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //performSegue(withIdentifier: "goToReminder", sender: self)
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
    
    //MARK:-  Buttons Clicked operation here :
    
    @IBAction func reminderClicked(_ sender: Any) {
        
        //TODO: Perform segue to the ReminderVC to get the reminder here:

        
    }
    @IBAction func useCurrentLocationClicked(_ sender: Any) {
        
        //TODO: Use the locationPicker cocoaPod to get the current location here:

        
    }
    
    @IBAction func setLocationClicked(_ sender: Any) {
        //TODO: Use the locationPicker cocoaPod to let the user select prefered location  here:

    }
    
    
     // MARK: - Prepare for segue here :
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
