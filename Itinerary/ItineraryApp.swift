//
//  ItineraryApp.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/9/24.
//

import SwiftUI

@main
struct ItineraryApp: App {
    @StateObject private var flightDataModel = FlightDataModel() // Create the shared data model
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flightDataModel) // Inject the shared data model into the environment
        }
    }
}
