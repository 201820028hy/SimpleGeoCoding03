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
        let path = Bundle.main.path(forResource: "Plist", ofType: "plist")
        let contents = NSArray(contentsOfFile: path!)
        
        if let items = contents {
            for item in items {
                let addr = (item as AnyObject).value(forKey: "address")
                let title = (item as AnyObject).value(forKey: "title")
                let subTitle = (item as AnyObject).value(forKey: "subTitle")
                
                let geoCorder = CLGeocoder()
                geoCorder.geocodeAddressString(addr! as! String, completionHandler: {
                    placemarks, error in
                    
                    if error != nil {
                        print("")
                    }
                    
                    if let myPlacemarks = placemarks {
                        let myPlacemark = myPlacemarks[0]
                        
                        let pin = MKPointAnnotation()
                        pin.title = title as? String
                        pin.subtitle = subTitle as? String

                        if let loc = myPlacemark.location {
                            pin.coordinate = loc.coordinate
                            pins.append(pin)
                        }
                        
                    }
                    self.mapView.showAnnotations(pins, animated: true)
                })
                }
            }
        
        //GeoCoder 클래스 객체 하나 생성
        //후행Closure
//        let forwardGC = CLGeocoder()
//        forwardGC.geocodeAddressString(addr01) {
//            placemarks, error in
//            //(placemarks:[CLPlacemark]?, error: Error?) in
//
//            if error != nil {
//
//                print(error!)
//            }
//
//            if let myPlacemark = placemarks {
//
//                let placemark = myPlacemark[0]
//
//                let pin01 = MKPointAnnotation()
//                pin01.coordinate = placemark.location!.coordinate
//                print(pin01.coordinate)
//                pin01.title = "동의과학대학교"
//                pin01.subtitle = "우리학교"
//
//                pins.append(pin01)
//                self.mapView.showAnnotations(pins, animated: true)
//            }
//        }
    
//    let lat = 35.16587040
//    let lng = 129.07284610
//    let location = CLLocation(latitude: lat, longitude: lng)
//
//    let geoCoder = CLGeocoder()
//
//        geoCoder.reverseGeocodeLocation(location) {
//            (placemarks: [CLPlacemark]?, error: Error?) in
//            if error != nil {
//                print("gg")
//            }
//
//            if let myPlacemark = placemarks {
//                let placemark = myPlacemark[0]
//
//                print(placemark.compactAddress!)
////                print(placemark.country!)
////                print(placemark.name!)
////                print(placemark.postalCode!)
////                print(placemark.administrativeArea!)
//
//            } else {
//                print("nil 발생")
//            }
//
//        }
        
        


}
}

