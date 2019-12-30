//
//  MapModel.swift
//  SDKMapDemo
//
//  Created by Alisdair Templeton on 30/12/19.
//  Copyright © 2019 Alisdair Templeton. All rights reserved.
//

import MapKit
import SAPFiori

class MapModel {

    let title: String = "Hobart Map"

    let region: MKCoordinateRegion = {
        let center = CLLocationCoordinate2D(latitude: -42.9267082, longitude: 147.3483356)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        return MKCoordinateRegion(center: center, span: span)
    }()
    
    let mapType: MKMapType = .mutedStandard

    var layers: [FUIGeometryLayer] = [
        FUIGeometryLayer(displayName: "Fauna"),
        FUIGeometryLayer(displayName: "Flora")
    ]
    
    var legendTitle: String {
        return title + " Legend"
    }
    
    let legendModel: [FUIMapLegendItem] = {
        
        let mapLegendItem: FUIMapLegendItem = {
            var mapItem = FUIMapLegendItem(title: "Item")
            mapItem.backgroundColor = UIColor.orange
            mapItem.icon = FUIMapLegendIcon(glyphImage: "")
            return mapItem
        }()
        
        return [mapLegendItem]
    }()
    
    let editingModel: [FUIMapLegendItem] = {

        let floraItem: FUIMapLegendItem = {
            var item = FUIMapLegendItem(title: "Flora")
            return item
        }()

        let faunaItem: FUIMapLegendItem = {
            var item = FUIMapLegendItem(title: "Fauna")
            return item
        }()

        return [floraItem, faunaItem]
    }()
    
    
    
    
    public var floraLayerIsEnabled: Bool = true
    public var _flora: [FUIAnnotation] = []
    public var flora: [FUIAnnotation] {
        get {
            guard floraLayerIsEnabled else { return [] }
            return _flora
        }
    }
   
    public var faunaLayerIsEnabled: Bool = true
    public var _fauna: [FUIAnnotation] = []
    public var fauna: [FUIAnnotation] {
        get {
            guard faunaLayerIsEnabled else { return [] }
            return _fauna
        }
    }
    
}
