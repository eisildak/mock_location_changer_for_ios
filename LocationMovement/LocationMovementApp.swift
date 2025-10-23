//
//  LocationMovementApp.swift
//  LocationMovement
//
//  Created by Putu Kusumawardhani & David Lam on 5.01.2022.
//  Copyright (c) 2022 Testlio. All rights reserved.

import SwiftUI
import UIKit
import CoreLocation

//@UIApplicationMain
class LocationMovementAppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    var window: UIWindow?
    let locationManager = CLLocationManager()
    
    func location() {
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        location()
        return true
    }
}

@main
struct LocationMovementApp: App {
    @UIApplicationDelegateAdaptor(LocationMovementAppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
