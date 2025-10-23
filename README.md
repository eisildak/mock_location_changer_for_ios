# LocationMovement - GPS Location Spoofing for iOS

A SwiftUI iOS application for testing location-based features using GPX (GPS Exchange Format) files to simulate fake GPS locations.

## Features

- 📍 **Static Location Spoofing** - Set a fixed GPS coordinate
- 🚶 **Dynamic Route Simulation** - Follow a predefined walking/driving route
- 🗺️ **GPX File Support** - Import custom GPX files for location simulation
- 📱 **Real Device Testing** - Test on physical iPhone devices
- 🎯 **Mayo Clinic Example** - Pre-configured with Mayo Clinic Phoenix coordinates

## Requirements

- Xcode 15.1 or later
- iOS 17.0 or later
- Physical iPhone device (recommended for testing)
- Valid Apple Developer account for device installation

## Installation Steps

### 1. Clone or Download Project
```bash
git clone <repository-url>
cd LocationMovement
```

### 2. Open Project in Xcode
```bash
open LocationMovement.xcodeproj
```

### 3. Configure Development Team
- Select your project in Xcode navigator
- Go to **Signing & Capabilities**
- Select your **Development Team**
- Ensure **Bundle Identifier** is unique

### 4. Build and Install on Device
- Connect your iPhone via USB
- Select your device as target
- Press **⌘ + R** to build and run
- Trust the developer profile on your iPhone when prompted

## GPX File Configuration

### Method 1: Edit Scheme (Recommended)

1. **Open Edit Scheme**
   - In Xcode: **Product → Scheme → Edit Scheme...** (or **⌘ + <**)

2. **Configure Location Simulation**
   - Select **Run** tab on the left
   - Click **Options** tab on the right
   - Check **"Allow Location Simulation"** ✅
   - From **"Default Location"** dropdown, select your GPX file

3. **Apply Settings**
   - Click **Close**
   - Run your app (**⌘ + R**)

### Method 2: Debug Menu (Alternative)

1. **Run Application First**
   - Build and run your app on device

2. **Select GPX File**
   - In Xcode: **Debug → Simulate Location → [Your GPX File]**

3. **Verify Location**
   - Open **Maps** app on your iPhone
   - Check if blue dot shows your simulated location

## GPX File Types

### Static Location GPX
For fixed GPS coordinates (e.g., Mayo Clinic):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.1" creator="Xcode">
    <wpt lat="33.659301" lon="-111.958414">
        <name>Mayo Clinic Phoenix</name>
        <desc>Mayo Clinic Hospital, Phoenix, Arizona, USA</desc>
    </wpt>
</gpx>
```

### Dynamic Route GPX
For moving simulation with waypoints:

```xml
<?xml version="1.0"?>
<gpx version="1.1" creator="gpxgenerator.com">
<wpt lat="33.659301" lon="-111.958414">
    <ele>331.2</ele>
    <time>2024-01-01T08:00:00Z</time>
</wpt>
<wpt lat="33.659500" lon="-111.958350">
    <ele>331.5</ele>
    <time>2024-01-01T08:00:45Z</time>
</wpt>
<!-- More waypoints... -->
</gpx>
```

## Included GPX Files

| File | Type | Description |
|------|------|-------------|
| `mayo_clinic_phoenix.gpx` | Static | Mayo Clinic Hospital fixed location |
| `mayo_clinic_walking_tour.gpx` | Dynamic | 25-minute walking route around Mayo Clinic |

## Testing Process

### 1. Verify Location Spoofing
- Open **Maps** app on your iPhone
- Look for blue dot at simulated location
- For dynamic routes: observe movement over time

### 2. Test Your Location-Based App
- Open your app that uses location services
- Verify it receives the simulated GPS coordinates
- Test location-dependent features

### 3. Monitor Location Updates
- Use `CLLocationManager` delegate methods
- Check coordinate accuracy and timestamps
- Verify location permission handling

## Troubleshooting

### GPX Not Working
1. **Check Edit Scheme Settings**
   - Ensure "Allow Location Simulation" is checked
   - Verify correct GPX file is selected

2. **Try Debug Menu Method**
   - Use **Debug → Simulate Location** while app is running

3. **Restart Application**
   - Stop app (⌘ + .)
   - Clean build folder (⌘ + Shift + K)
   - Rebuild and run (⌘ + R)

### Location Not Updating
1. **Check Location Permissions**
   - Ensure app has location access in Settings
   - Use `requestAlwaysAuthorization()` or `requestWhenInUseAuthorization()`

2. **Verify GPX Format**
   - Check XML syntax is valid
   - Ensure coordinates are in correct format (latitude, longitude)
   - Verify time intervals for dynamic routes

### Memory Warnings
```
malloc: xzm: failed to initialize deferred reclamation buffer
```
- This is a system-level warning and can be ignored
- Does not affect GPX location simulation functionality

## Creating Custom GPX Files

### Static Location
1. Find your desired coordinates (use Google Maps)
2. Create GPX with single `<wpt>` waypoint
3. Add to your Xcode project

### Dynamic Route
1. Plan your route with multiple coordinates
2. Set realistic time intervals (30-120 seconds)
3. Add elevation data for better realism
4. Include descriptive waypoint names

### Time Intervals for Realistic Movement
- **Walking Speed**: 60-90 seconds between waypoints
- **Cycling Speed**: 30-45 seconds between waypoints  
- **Driving Speed**: 15-30 seconds between waypoints

## Code Integration

### LocationManager Setup
```swift
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle location updates (will receive simulated locations)
    }
}
```

## License

This project is for educational and testing purposes only. Ensure compliance with location spoofing policies in production applications.

## Support

For issues related to:
- **GPX File Format**: Check XML syntax and coordinate format
- **Xcode Configuration**: Verify Edit Scheme settings
- **Location Permissions**: Check iOS Settings → Privacy & Security → Location Services

---

**Note**: This tool is designed for development and testing purposes. Always respect user privacy and location data handling best practices in production applications.