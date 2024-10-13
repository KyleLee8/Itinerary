//
//  FlightData.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/12/24.
//

import Foundation

func saveFlight(airline: String, departureTime: String, arrivalTime: String, price: Double, duration: String) {
    let flight = Flight(airline: airline, departureTime: departureTime, arrivalTime: arrivalTime, price: price, duration: duration)
    
    // Load existing flights
    var flights = loadSavedFlights()
    flights.append(flight)
    
    // Save back to UserDefaults
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(flights) {
        UserDefaults.standard.set(encoded, forKey: "savedFlights")
    }
}

func loadSavedFlights() -> [Flight] {
    if let data = UserDefaults.standard.data(forKey: "savedFlights"),
       let decodedFlights = try? JSONDecoder().decode([Flight].self, from: data) {
        return decodedFlights
    }
    return []
}

