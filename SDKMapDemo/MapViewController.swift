//
//  MapViewController.swift
//  SDKMapDemo
//
//  Created by Alisdair Templeton on 30/12/19.
//  Copyright © 2019 Alisdair Templeton. All rights reserved.
//

import SAPFiori
import MapKit

class MapViewController: FUIMKMapFloorplanViewController, MKMapViewDelegate, FUIMKMapViewDelegate {
    
    var model = MapModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.setRegion(model.region, animated: true)
        mapView.mapType = model.mapType
        mapView.showsUserLocation = false
        mapView.register(FUIMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "FUIMarkerAnnotationView")
        
        self.dataSource = self
        self.delegate = self
        
        legend.headerTextView.text = model.legendTitle
        legend.items = model.legendModel
        
        self.isEditable = true
        self.editingPanel.createGeometryItems = model.editingModel
      //  self.editingPanel.createGeometryResultsController = CreateGeometryResultsController()
//        self.editingPanel.willShowCreateGeometryResultsController = { [unowned self] vc in
//            if let createGeometryResultsController = vc as? CreateGeometryResultsController {
//                createGeometryResultsController.editingGeometry = self.editingGeometry
//            }
//        }
        
        
        
        
        
        //TESTING
        let testLocation = FaunaAnnotation(coordinate: CLLocationCoordinate2D(latitude: -42.9267082, longitude: 147.3483356))
        self.model._fauna.append(testLocation)
        
        
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "FUIMarkerAnnotationView") as? FUIMarkerAnnotationView else { return nil}
        annotationView.markerTintColor =  UIColor.purple
        return annotationView
        
    }

}

extension MapViewController: FUIMKMapViewDataSource {
    func mapView(_ mapView: MKMapView, geometriesForLayer layer: FUIGeometryLayer) -> [FUIAnnotation] {
        
        switch layer.displayName {
            case "Flora":
                return self.model.flora
            case "Fauna":
                return model.fauna
            default:
                preconditionFailure()
        }
    }
    
    func mapView(_ mapView: MKMapView, layerAtIndex index: Int) -> FUIGeometryLayer {
        self.model.layers[index]
    }
    
    func numberOfLayers(in mapView: MKMapView) -> Int {
        self.model.layers.count
    }
    

}
