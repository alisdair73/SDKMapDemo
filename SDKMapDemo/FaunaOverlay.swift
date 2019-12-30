//
//  FaunaOverlay.swift
//  SDKMapDemo
//
//  Created by Alisdair Templeton on 30/12/19.
//  Copyright © 2019 Alisdair Templeton. All rights reserved.
//

import Foundation
import MapKit
import SAPFiori

class FaunaAnnotation: MKPointAnnotation, FUIAnnotation {
    
    var state: FUIMapFloorplan.State = .default
    
    var layer: FUIGeometryLayer = FUIGeometryLayer(displayName: "Fauna")
    
    var indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
}
