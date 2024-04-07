//
//  CafeMapVC.swift
//  CafeApp
//
//  Created by Fikrat on 03.04.24.
//

import UIKit
import MapKit

class CafeMapVC: UIViewController {
    
    var cafe : CafeListModel?
    var id = 0
    
    var mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapConstraints ()
        
        let annotation = MKPointAnnotation()
        annotation.title = cafe?.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: cafe?.lat ?? 0.0, longitude: cafe?.long ?? 0.0)
        mapView.addAnnotation(annotation)
        mapView.isZoomEnabled = true
        mapView.center = view.center
        mapView.isScrollEnabled = true
        
        view.addSubview(mapView)
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
         let coor = CLLocationCoordinate2D(latitude: cafe?.lat ?? 0.0, longitude: cafe?.long ?? 0.0)

        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) // Adjust this as needed
    
        
        let region = MKCoordinateRegion(center: coor, span: span)
        let adjustedRegion = mapView.regionThatFits(region)
                
        mapView.setRegion(region, animated: true)
        
        mapView.addAnnotation(annotation)
    }
    
    func setupMapConstraints() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}







