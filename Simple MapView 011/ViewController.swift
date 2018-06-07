//
//  ViewController.swift
//  Simple MapView 011
//
//  Created by D7702_10 on 2018. 6. 7..
//  Copyright © 2018년 ksh. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //위도, 경도 설정
    
        let loc : CLLocationCoordinate2D =
            CLLocationCoordinate2D(latitude:35.166025, longitude: 129.070354)
        let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
        let region = MKCoordinateRegion(center: loc, span: span)
        myMapView.setRegion(region, animated: true)
        
        let anno = MKPointAnnotation()
        anno.coordinate = loc
        anno.title = "DIT 동의과학대학교"
        anno.subtitle = "내 꿈이 자라는 곳"
        myMapView.addAnnotation(anno)
    
    }


}

