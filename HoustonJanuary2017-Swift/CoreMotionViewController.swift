//
//  CoreMotionViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/21/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion


class CoreMotionViewController : UIViewController {
    
    @IBOutlet weak var imageView :UIImageView! 
    private var manager :CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.manager = CMMotionManager()
        
        if self.manager.isDeviceMotionAvailable {
            
            self.manager.deviceMotionUpdateInterval = 0.01
            
            self.manager.startDeviceMotionUpdates(to: .main, withHandler: { (data :CMDeviceMotion?, error :Error?) in
                
                if let gravity = data?.gravity {
                    
                    let rotation = atan2(gravity.x, gravity.y) - M_PI
                    self.imageView.transform = CGAffineTransform(rotationAngle:CGFloat(rotation))
                    
                }
                
            })
            
        }
        
//        if self.manager.isAccelerometerAvailable {
//            self.manager.accelerometerUpdateInterval = 0.01
//            
//            
//            
//            self.manager.startAccelerometerUpdates(to: .main, withHandler: { (data:CMAccelerometerData?, error :Error?) in
//                
//                if let data = data {
//                    
//                    let acceleration = data.acceleration
//                    let rotation = atan2(acceleration.x, acceleration.y) - M_PI
//                    self.imageView.transform = CGAffineTransform(rotationAngle:CGFloat(rotation))
//                    
//                }
//                
//            })
//            
//        }
        
        
    }
    
}
