//
//  MapsViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/13/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //public typealias NewAwesomeDoubleType = Double

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager :CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        
        // asking the user for permission to use maps
        self.locationManager.requestWhenInUseAuthorization()
        
        self.mapView.showsUserLocation = true
        self.locationManager.startUpdatingLocation()
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
//        let carAnnotationView = CarAnnotationView(annotation: annot)
//        set the frame
//        return carAnnotatioNView
//        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "MyAnnotation")
        annotationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        annotationView.canShowCallout = true
        
        let carImage = UIImage(named: "car.gif")
        let carImageView = UIImageView(image: carImage)
        carImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        
        annotationView.addSubview(carImageView)
        
        return annotationView
    }
    
    @IBAction func addAnnotationButtonPressed() {
        
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString("1200 Richmond Ave, Houston TX 77042") { (placemark :[CLPlacemark]?, error: Error?) in
//            
//            
//            
//        }
//        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Restuarant"
        
        let region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 250, 250)
        
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { (response :MKLocalSearchResponse?, error: Error?) in
            
            for mapItem in (response?.mapItems)! {
                print(mapItem.placemark.addressDictionary)
            }
            
        }
        
//        let annotation = MKPointAnnotation()
//        annotation.title = "Hello Houston!"
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 29.53522956294847, longitude: -95.44921875)
//        
//        self.mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
       
//        if let annotationView = views.first {
//            if let annotation = annotationView.annotation {
//                if annotation is MKUserLocation {
//                    
//                    let region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 500, 500)
//                    
//                    self.mapView.setRegion(region, animated: true)
//                    
//                }
//            }
//        }
        
    }
}






