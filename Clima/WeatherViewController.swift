//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation


class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "d295c29c01a41ee3c9b40553268ef71"
    
    
    //TODO: Declare instance variables here
    let locationManager  = CLLocationManager()

    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
          print("User has not authorized location services")
            return;
        }
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
           print ("Not available")
            return
        }*/
        
        // Configure and start the service.
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0  // In meters.
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        print ("Updated location already")
    
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    

    func getWeatherData(params : Dictionary<String,String>){
        for (key, value) in params{
            print ("Key : \(key), val : \(value)")
        }
    }
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (locations[locations.count-1].horizontalAccuracy>0){
            print ("Got a good location")
            let location = locations[locations.count-1]
            if let unwrappedFloor = location.floor {
                print ("Floor \(unwrappedFloor.level)")
            }
            print ("Lat: \(location.coordinate.latitude) , Long : \(location.coordinate.longitude)")
            cityLabel.text = "Lat: \(location.coordinate.latitude) , Long : \(location.coordinate.longitude)"
            //locationManager.stopUpdatingLocation()
            let params  = ["lat" : String ( location.coordinate.latitude), "lon" : String(location.coordinate.longitude), "app_id" : APP_ID]
            getWeatherData(params : params)
        }
        else {
            print ("Not a valid location")
        }
        
       
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print (error)
        cityLabel.text = "Location Unavailable"
    }
    
    
    //Write the didFailWithError method here:
    
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


