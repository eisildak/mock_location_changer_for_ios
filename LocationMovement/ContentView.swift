import SwiftUI
import MapKit

struct ContentView: View {
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
                    
                    VStack(spacing: 5) {
                        Text("Pointr")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text("LocationMovement")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
                    .multilineTextAlignment(.center)
                }
                .padding(.top, 50)
                
                Spacer()
                
                // Instructions section
                VStack(spacing: 20) {
                    VStack(spacing: 15) {
                        HStack {
                            Image(systemName: "1.circle.fill")
                                .foregroundColor(.blue)
                                .font(.title2)
                            Text("Open your Maps to verify")
                                .font(.headline)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "2.circle.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                            Text("Check your mock location coordinates")
                                .font(.headline)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "3.circle.fill")
                                .foregroundColor(.orange)
                                .font(.title2)
                            Text("GPX files are configured in Xcode")
                                .font(.headline)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
