//
//  FlightStorage.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/12/24.
//

import Foundation

struct FlightStorage {
    
    static let flightsKey = "savedFlights"
    
    // Function to save flights to UserDefaults
    static func saveFlights(_ flights: [Flight]) {
        if let encoded = try? JSONEncoder().encode(flights) {
            UserDefaults.standard.set(encoded, forKey: flightsKey)
        }
    }
    
    // Function to load flights from UserDefaults
    static func loadFlights() -> [Flight] {
        if let data = UserDefaults.standard.data(forKey: flightsKey),
           let decodedFlights = try? JSONDecoder().decode([Flight].self, from: data) {
            return decodedFlights
        }
        return []
    }
}
