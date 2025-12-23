import SwiftUI
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }
}

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Logo section
                VStack(spacing: 15) {
                    Image(systemName: "location.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    
                    Text("LocationMovement")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 50)
                
                Spacer()
                
                // Mini Map
                GeometryReader { geometry in
                    Map(coordinateRegion: $locationManager.region, annotationItems: [MapLocation(coordinate: locationManager.region.center)]) { location in
                        MapMarker(coordinate: location.coordinate, tint: .blue)
                    }
                    .frame(width: geometry.size.width * 0.85, height: 180)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .frame(width: geometry.size.width)
                }
                .frame(height: 180)
                .padding(.horizontal, 20)
                
                // Instructions section
                ScrollView {
                    VStack(spacing: 15) {
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "1.circle.fill")
                                .foregroundColor(.blue)
                                .font(.title3)
                                .frame(width: 30)
                            Text("Open your Maps to verify")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer(minLength: 0)
                        }
                        
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "2.circle.fill")
                                .foregroundColor(.green)
                                .font(.title3)
                                .frame(width: 30)
                            Text("Check your mock location coordinates")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer(minLength: 0)
                        }
                        
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "3.circle.fill")
                                .foregroundColor(.orange)
                                .font(.title3)
                                .frame(width: 30)
                            Text("GPX files are configured in Xcode")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer(minLength: 0)
                        }
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 15)
                }
                .frame(height: 150)
                .background(Color.white.opacity(0.8))
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Info Note
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.blue)
                        Text("To disable Mock GPS, stop the app run from Xcode")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal, 20)
                
                // Status indicator
                HStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 12, height: 12)
                    Text("GPS Simulation Active")
                        .font(.caption)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(20)
                .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 1)
                
                // Copyright section
                VStack(spacing: 5) {
                    Text("Copyright © 2025 Pointr")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .italic()
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct MapLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
