//
//  ViewController.swift
//  Map
//
//  Created by juhoon lee on 2023/02/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    @IBOutlet var lblLocationInfo2: UILabel!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var maMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        maMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion  = MKCoordinateRegion(center: pLocation, span: spanValue)
        maMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        maMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)! , delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!
            if pm!.locality != nil {
                address += ""
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "?????? ??????"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "????????????????????? ???????????????", subtitle: "????????? ????????? ??????????????? 121")
            self.lblLocationInfo1.text = "?????? ?????? ??????"
            self.lblLocationInfo2.text = "????????????????????? ???????????????"
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.566876, longitudeValue: 126.914066, delta: 0.1, title: "????????? ????????????", subtitle: "????????? ????????? ???????????? 109 ????????? ??????")
            self.lblLocationInfo1.text = "?????? ?????? ??????"
            self.lblLocationInfo2.text = "????????????????????? ?????????"
        }else if sender.selectedSegmentIndex == 3{
            setAnnotation(latitudeValue: 37.44862243524498, longitudeValue: 126.65744915061298, delta: 0.1, title: "????????????", subtitle: "??????????????? ???????????? ????????? 100")
            self.lblLocationInfo1.text = "?????? ?????? ??????"
            self.lblLocationInfo2.text = "????????????????????????"
        }
    }
}

