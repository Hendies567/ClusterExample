//
//  ViewController.swift
//  ClusterExample
//
//  Created by George Leadbeater on 01/06/2018.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapBackgroundView: UIView!
    var clusterManager: GMUClusterManager!
    var renderer: GMUDefaultClusterRenderer!
    var clusterItems = [ClusterItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpMap()
    }
    
    func setUpMap() {
        gmap.settings.setAllGesturesEnabled(false)
        var bounds = GMSCoordinateBounds()
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        renderer = GMUDefaultClusterRenderer(mapView: gmap,
                                             clusterIconGenerator: iconGenerator)
        clusterManager = GMUClusterManager(map: gmap, algorithm: algorithm,
                                           renderer: renderer)
        renderer.delegate = self
        
        let highlight1 =
                    ClusterItem(position: CLLocationCoordinate2DMake(31.635717000000003, -7.989590999999998), name: "1", type: "Highlight", imgString: "")
        clusterManager.add(highlight1)
        self.clusterItems.append(highlight1)
        
        let highlight2 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.632602000000002, -7.98841), name: "2", type: "Highlight", imgString: "")
        clusterManager.add(highlight2)
        self.clusterItems.append(highlight2)
        
        let highlight3 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.433902, -8.202002999999998), name: "3", type: "Highlight", imgString: "")
        clusterManager.add(highlight3)
        self.clusterItems.append(highlight3)
        
        let highlight4 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.6426512, -8.003152199999999), name: "4", type: "Highlight", imgString: "")
        clusterManager.add(highlight4)
        self.clusterItems.append(highlight4)
        
        let highlight5 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.629472300000003, -7.981084500000001), name: "5", type: "Highlight", imgString: "")
        clusterManager.add(highlight5)
        self.clusterItems.append(highlight5)
        
        let highlight6 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.629472300000003, -7.981084500000001), name: "6", type: "Highlight", imgString: "")
        clusterManager.add(highlight6)
        self.clusterItems.append(highlight6)
        
        let hotel =
            ClusterItem(position: CLLocationCoordinate2DMake(31.63592, -7.98941), name: "1", type: "Hotel", imgString: "")
        clusterManager.add(hotel)
        self.clusterItems.append(hotel)
        
        let airport =
            ClusterItem(position: CLLocationCoordinate2DMake(31.6046477, -8.0231972), name: "1", type: "Airport", imgString: "")
        clusterManager.add(airport)
        self.clusterItems.append(airport)
        
        let atrraction1 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.6277, -8.0234), name: "1", type: "Attraction", imgString: "")
        clusterManager.add(attraction1)
        self.clusterItems.append(attraction1)
        
        let atrraction2 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.605, -8.024), name: "2", type: "Attraction", imgString: "")
        clusterManager.add(attraction2)
        self.clusterItems.append(attraction2)
        
        let atrraction3 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.61, -8.024), name: "3", type: "Attraction", imgString: "")
        clusterManager.add(attraction3)
        self.clusterItems.append(attraction3)
        
        let atrraction4 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.65, -8.020), name: "4", type: "Attraction", imgString: "")
        clusterManager.add(attraction4)
        self.clusterItems.append(attraction4)
        
        let atrraction5 =
            ClusterItem(position: CLLocationCoordinate2DMake(31.64, -8.027), name: "5", type: "Attraction", imgString: "")
        clusterManager.add(attraction5)
        self.clusterItems.append(attraction5)
        
        for item in clusterItems {
            bounds = bounds.includingCoordinate(item.position)
        }
        
        clusterManager.cluster()
        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.1)) {
            gmap.frame = self.mapBackgroundView.bounds
            gmap.moveCamera(GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(50.0 ,50.0 ,50.0 ,50.0)))
        }
        self.mapBackgroundView.addSubview(gmap)
    }
}
extension ViewController: GMUClusterRendererDelegate {
    func renderer(_ renderer: GMUClusterRenderer, willRenderMarker marker: GMSMarker) {
        if marker.userData is GMUCluster {
        } else {
            if let data = marker.userData as? ClusterItem {
                marker.icon = markerIcon(type: data.type)
                marker.title = data.name
            }
        }
    }
}

