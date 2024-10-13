import SwiftUI

struct ItineraryView: View {
    @EnvironmentObject var flightDataModel: FlightDataModel // Inject the shared data model

    var body: some View {
        VStack {
            if flightDataModel.savedFlights.isEmpty {
                Text("No flights in your itinerary.")
                    .font(.headline)
                    .padding()
            } else {
                List(flightDataModel.savedFlights) { flight in
                    VStack(alignment: .leading) {
                        Text(flight.airline)
                            .font(.headline)
                        Text("Departure: \(flight.departureTime)")
                        Text("Arrival: \(flight.arrivalTime)")
                        Text("Price: $\(flight.price, specifier: "%.2f")")
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Your Itinerary")
        .onAppear {
            flightDataModel.loadSavedFlights() // Reload flights when the view appears
        }
    }
}

struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView()
            .environmentObject(FlightDataModel()) // Provide the environment object for preview
    }
}
