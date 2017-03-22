//
//  BoardGameViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/22/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import CoreMotion

class CircleView : UIView {
    
    override func draw(_ rect: CGRect) {
        
        UIColor.green.setFill()
        let circle = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 50, height: 50))
        circle.fill()
    }
    
}

class BoardGameViewController: UIViewController {

    private var manager :CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.manager = CMMotionManager()
        
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        circleView.backgroundColor = UIColor.clear
        circleView.center = self.view.center
        self.view.addSubview(circleView)
        
        if self.manager.isDeviceMotionAvailable {
            self.manager.deviceMotionUpdateInterval = 0.01
            
            self.manager.startDeviceMotionUpdates(to: .main, withHandler: { (data :CMDeviceMotion?, error: Error?) in
                
                if let gravity = data?.gravity {
                    
                    print(gravity.x)
                    print(gravity.y)
                    
                    let x = gravity.x * 10.0
                    let y = gravity.y * 10.0
                    
                    circleView.center = CGPoint(x: circleView.center.x + CGFloat(x), y: circleView.center.y + CGFloat(y))
                    
                }
                
            })
        }
        
    }

   
}
