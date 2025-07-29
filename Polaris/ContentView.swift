//
//  ContentView.swift
//  Polaris
//
//  Created by Ansh Goyal on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MissionControlView()
                .tabItem {
                    Label("Mission", systemImage: "house.fill")
                }
            
            DailyTrackerView()
                .tabItem {
                    Label("Thrust", systemImage: "flame.fill")
                }
            
            LongTermVisionView()
                .tabItem {
                    Label("Polaris", systemImage: "target")
                }
            
            StarMapView()
                .tabItem {
                    Label("Star Map", systemImage: "chart.bar.xaxis")
                }
            
            StellarArchiveView()
                .tabItem {
                    Label("Archive", systemImage: "star.circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
