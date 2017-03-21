//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class CircleView : UIView {
    
    override func draw(_ rect: CGRect) {
        
        UIColor.red.setFill()
        UIColor.purple.setStroke()
        let circle = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
        circle.fill()
        circle.stroke()
        
        UIColor.green.setStroke
        UIColor.green.setFill()
        let circle2 = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 150, height: 150))
        circle2.stroke()
        circle2.fill()
        
        UIColor.purple.setStroke()
        UIColor.blue.setFill()
        let line = UIBezierPath()
        line.lineWidth = 1
        line.move(to: CGPoint(x: 10, y: 10))
        line.addLine(to: CGPoint(x: 100, y: 10))
        line.addLine(to: CGPoint(x: 10, y: 100))
        line.close()
        
        line.fill()
        line.stroke()
        
        
    }
    
}

class CoreGraphicsViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

let circleView = CircleView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
circleView.backgroundColor = UIColor.orange

let coreGraphicsVC = CoreGraphicsViewController()
coreGraphicsVC.view.backgroundColor = UIColor.lightGray
coreGraphicsVC.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

coreGraphicsVC.view.addSubview(circleView)

PlaygroundPage.current.liveView = coreGraphicsVC

