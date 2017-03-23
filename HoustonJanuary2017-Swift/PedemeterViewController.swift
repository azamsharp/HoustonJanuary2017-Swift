//
//  PedemeterViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class PedemeterViewController: UIViewController {

    var pedometer :CMPedometer!
    var altimeter :CMAltimeter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pedometer = CMPedometer()
        self.altimeter = CMAltimeter()
        
        let calendar = Calendar.current
        
//        self.altimeter.startRelativeAltitudeUpdates(to: .main) { (data: CMAltitudeData?, error :Error?) in
//            
//            if let data = data {
//                print(data.relativeAltitude)
//            }
//            
//        }
        
        for day in 1...7 {
        
        let twoDaysAgo = calendar.date(byAdding: .day, value: -day, to: Date())
        
        self.pedometer.queryPedometerData(from: twoDaysAgo!, to: Date()) { (data :CMPedometerData?, error :Error?) in
            
            print(data?.floorsAscended)
            print(data?.floorsDescended)
            
            print(data?.distance)
            
            print(data?.numberOfSteps)
            
        }
            
        }
        
        
    }


}
