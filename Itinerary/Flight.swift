//
//  Flight.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/12/24.
//

import Foundation

// Define the Flight model that represents flight data
struct Flight: Identifiable, Codable {
    var id = UUID() // A unique identifier for SwiftUI
    let airline: String
    let departureTime: String
    let arrivalTime: String
    let price: Double
    let duration: String
}
