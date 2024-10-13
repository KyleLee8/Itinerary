import Foundation
import Combine

class FlightDataModel: ObservableObject {
    @Published var savedFlights: [Flight] = []

    init() {
        loadSavedFlights() // Load flights when the model is initialized
    }

    // Load saved flights from UserDefaults
    func loadSavedFlights() {
        if let data = UserDefaults.standard.data(forKey: FlightStorage.flightsKey),
           let decodedFlights = try? JSONDecoder().decode([Flight].self, from: data) {
            savedFlights = decodedFlights // Update savedFlights if data exists
        } else {
            savedFlights = [] // Ensure it's an empty array if no data is found
        }
    }

    // Function to add a flight to the itinerary
    func addFlight(_ flight: Flight) {
        savedFlights.append(flight) // Add the flight to the list
        saveFlights() // Save the updated list to UserDefaults
        print("Added \(flight.airline) flight to itinerary!") // Log the addition
    }

    // Save flights to UserDefaults
    private func saveFlights() {
        if let encoded = try? JSONEncoder().encode(savedFlights) {
            UserDefaults.standard.set(encoded, forKey: FlightStorage.flightsKey) // Store the encoded flights
        }
    }
}
