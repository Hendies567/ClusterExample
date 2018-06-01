//
//  ClusterItem.swift
//  ClusterExample
//
//  Created by Ashley Henderson on 01/06/2018.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import GoogleMaps

class ClusterItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    var name: String!
    var type: String!
    var imgString: String!
    
    init(position: CLLocationCoordinate2D, name: String, type: String, imgString: String) {
        self.position = position
        self.name = name
        self.type = type
        self.imgString = imgString
    }
}
