//
//  PinkViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/22/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class PinkViewController: UIViewController {
    
    var manager :CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.manager = CMMotionManager()
        
        if self.manager.isDeviceMotionAvailable {
            
            self.manager.deviceMotionUpdateInterval = 0.01
            
            self.manager.startDeviceMotionUpdates(to: .main, withHandler: { (data :CMDeviceMotion?, error :Error?) in
                
                if let acceleration = data?.userAcceleration {
                    
                    if acceleration.x < -2.00 {
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                    
                    
                }
                
            })
            
        }

    }

}
