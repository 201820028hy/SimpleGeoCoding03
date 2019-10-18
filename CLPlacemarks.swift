//
//  CLPlacemarks.swift
//  SimpleGeoCoding03
//
//  Created by dit03 on 2019. 10. 17..
//  Copyright © 2019년 201820028. All rights reserved.
//

import CoreLocation

extension CLPlacemark {
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let street = thoroughfare {
                result += ", \(street)"
            }
            
            if let city = locality {
                result += ", \(city)"
            }
            
            if let country = country {
                result += ", \(country)"
            }
            
            return result
        }
        return nil
    }
}
