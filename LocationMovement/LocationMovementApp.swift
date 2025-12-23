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
    
    func applicationWillTerminate(_ application: UIApplication) {
        // App kapanırken location manager'ı tamamen durdur
        locationManager.stopUpdatingLocation()
    }
}

@main
struct LocationMovementApp: App {
    @UIApplicationDelegateAdaptor(LocationMovementAppDelegate.self) var delegate
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .background {
                // App background'a gittiğinde location manager'ı durdur
                delegate.locationManager.stopUpdatingLocation()
            }
        }
    }
}
