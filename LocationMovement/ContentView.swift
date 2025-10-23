//
//  ContentView.swift
//  LocationMovement
//
//  Created by Putu Kusumawardhani & David Lam on 5.01.2022.
//  Copyright (c) 2022 Testlio. All rights reserved.

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Open your map app to verify that spoofing is working as intended.")
                .multilineTextAlignment(.center)
                .padding()
            Text("You will see where we are going, whoop whoop!")
                .multilineTextAlignment(.center)
                .padding()
            Text("Wow what sharp eyes you have. Use it to find bugs")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.blue.opacity(0.02))
            Text("Copyright (c) 2022 Testlio. All rights reserved.")
                .italic()
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
