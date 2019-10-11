//
//  ViewController.swift
//  SimpleGeoCoding03
//
//  Created by dit03 on 2019. 10. 11..
//  Copyright © 2019년 201820028. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var pins = [MKPointAnnotation]()
        
        let addr01 = "부산광역시 양정동 429-10"
        let addr02 = "부산광역시 부산진구 전포동 591-8"
        let addr = ["부산광역시 양정동 429-10", "부산진구 동성로 136"]
        
        //GeoCoder 클래스 객체 하나 생성
        //후행Closure
        let forwardGC = CLGeocoder()
        forwardGC.geocodeAddressString(addr01) {
            placemarks, error in
            //(placemarks:[CLPlacemark]?, error: Error?) in
            
            if error != nil {
                
                print(error!)
            }
            
            if let myPlacemark = placemarks {
                
                let placemark = myPlacemark[0]
                
                let pin01 = MKPointAnnotation()
                pin01.coordinate = placemark.location!.coordinate
                print(pin01.coordinate)
                pin01.title = "동의과학대학교"
                pin01.subtitle = "우리학교"
                
                pins.append(pin01)
                self.mapView.showAnnotations(pins, animated: true)
            }
        }
        
        let forwardGC2 = CLGeocoder()
        forwardGC2.geocodeAddressString(addr02) {
            placemarks, error in
            
            if error != nil {
                
                print(error!)
            }
            
            if let myPlacemark = placemarks {
                
                let placemark = myPlacemark[0]
                
                let pin02 = MKPointAnnotation()
                pin02.coordinate = placemark.location!.coordinate
                print(pin02.coordinate)
                pin02.title = "우리집"
                pin02.subtitle = "히히"
                
                pins.append(pin02)
                self.mapView.showAnnotations(pins, animated: true)
            }
        }
        
    }


}

