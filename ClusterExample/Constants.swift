//
//  Constants.swift
//  ClusterExample
//
//  Created by Ashley Henderson on 01/06/2018.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import GoogleMaps

var gmap: GMSMapView!

var markerHighlight = UIImage(named: "MarkerHighlight")
var markerAttraction = UIImage(named: "MarkerAttraction")
var markerHotel = UIImage(named: "MarkerHotel")
var markerAirport = UIImage(named: "MarkerAirport")
var markerBar = UIImage(named: "MarkerBar")
var markerRestaurant = UIImage(named: "MarkerRestaurant")
var markerPlace = UIImage(named: "MarkerPlace")
var markerLocation = UIImage(named: "MarkerLocation")
var markerFeatured = UIImage(named: "MarkerFeatured")
var markerSelected = UIImage(named: "MarkerSelected")

func markerIcon(type: String) -> UIImage {
    switch type {
    case "Highlight":
        return markerHighlight!
        
    case "Attraction":
        return markerAttraction!
        
    case "Hotel":
        return markerHotel!
        
    case "Airport":
        return markerAirport!
        
    case "Bar":
        return markerBar!
        
    case "Restaurant":
        return markerRestaurant!
        
    case "Place":
        return markerPlace!
        
    case "Location":
        return markerLocation!
        
    case "Featured":
        return markerFeatured!
        
    case "Selected":
        return markerSelected!
        
    default:
        return UIImage()
    }
}
