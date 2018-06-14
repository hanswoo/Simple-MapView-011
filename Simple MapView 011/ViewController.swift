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
    
    var foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점"]
    var foodStoreThumbnail = ["01", "02", "03", "04", "05", "06"]
    var foodStoreAddress = ["부산 부산진구 양정1동 350-1",
                            "부산시 부산진구 양정동 418-282",
                            "부산광역시 부산진구 양정동 393-18",
                            "부산광역시 부산진구 양정1동 356-22",
                            "부산광역시 부산진구 양정1동 350-1",
                            "부산 부산진구 양정동 양정동 353-38"]
    var i = 0
    
    //pin의 배열
    var annos = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //위도, 경도 설정
    
//        let loc : CLLocationCoordinate2D =
//            CLLocationCoordinate2D(latitude:35.166025, longitude: 129.070354)
//        let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
//        let region = MKCoordinateRegion(center: loc, span: span)
//        myMapView.setRegion(region, animated: true)
//
//        let anno = MKPointAnnotation()
//        anno.coordinate = loc
//        anno.title = "DIT 동의과학대학교"
//        anno.subtitle = "내 꿈이 자라는 곳"
//        myMapView.addAnnotation(anno)
        for item in foodStoreAddress  {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(item) {
                
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let myError = error{
                    print(myError)
                    return
                }
                let myPlacemark = placemarks![0]
                //print(myPlacemark.location?.coordinate)
                
                //한개씩 뽑아서 지도에 핀꼽기
                if let loc = myPlacemark.location{
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc.coordinate
                    anno.title = self.foodStoreNames[self.i]
                    self.i = self.i + 1
                    
                    //pin을 pin 배열에 추가
                    self.annos.append(anno)
                    self.myMapView.addAnnotations(self.annos)
                    //pin을 맵에 채워서 보여주기
                    self.myMapView.showAnnotations(self.annos, animated: true)
                }
                else{
                    print("에러발생")
                }
            }
            
        }
//        let geoCoder = CLGeocoder()
//
//        geoCoder.geocodeAddressString(){
//            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
//            if let error = error {
//                print(error)
//                return
//            }
//            if let myPlacemarks = placemarks{
//                let placemark = myPlacemarks[0]
//
//
//                let loc = placemark.location?.coordinate
//                let span = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.05)
//                let region = MKCoordinateRegionMake(loc!, span)
//                //let region = MKCoordinateRegionMakeWithDistance(loc!, 0.05, 0.05)
//                _ = MKCoordinateRegion(center: loc!, span: span)
//                self.myMapView.setRegion(region, animated: true)
//
//                //annotation
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = loc!
//                annotation.title = addr
//                annotation.subtitle = "번개반점"
//                self.myMapView.addAnnotation(annotation)
//            }
//
//        }
    
    }

}

