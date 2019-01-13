//
//  CustumTableViewCell.swift
//  LocaAlarm
//
//  Created by Dhrubojyoti on 12/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class CustumTableViewCell: UITableViewCell {

    //TODO: Create your instance variable here :
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var adressText: UILabel!
    @IBOutlet weak var reminder: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - On Off switch operation here :
    @IBAction func onOffSwitchPressed(_ sender: UISwitch) {
        //TODO: If change the Switch state when pressed
    }
}
