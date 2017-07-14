//
//  FirstViewController.swift
//  YogaInstructorsApp
//
//  Created by Lane Faison on 7/11/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UserDataDelegate {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUserDataInfo(info: User) {
        print("$$$$$$$$$")
        print(info)
        mainLabel.text = info.name
        
    }


}

