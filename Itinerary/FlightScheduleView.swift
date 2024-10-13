import SwiftUI

struct FlightScheduleView: View {
    let country: String
    @State private var selectedDate = Date()
    @EnvironmentObject var flightDataModel: FlightDataModel // Inject the shared data model
    @State var flights: [Flight] = [] // Keep this for mock data
    
    var body: some View {
        VStack {
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            if flights.isEmpty {
                Text("No flights available for the selected date.")
                    .font(.headline)
                    .padding()
            } else {
                List(flights, id: \.departureTime) { flight in
                    VStack(alignment: .leading) {
                        Text(flight.airline)
                            .font(.headline)
                        Text("Departure: \(flight.departureTime)")
                        Text("Arrival: \(flight.arrivalTime)")
                        Text("Price: $\(flight.price, specifier: "%.2f")")
                        
                        // Button to add flight to itinerary
                        Button(action: {
                            flightDataModel.addFlight(flight) // Use the shared model to add flights
                        }) {
                            Text("Add to Itinerary")
                                .foregroundColor(.blue)
                                .padding(5)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("\(country) Flights")
        .onAppear {
            loadMockFlights() // Load mock flights when the view appears
        }
    }
    
    private func loadMockFlights() {
        flights = [
            Flight(airline: "Airline A", departureTime: "10:00 AM", arrivalTime: "12:00 PM", price: 200.0, duration: "2h"),
            Flight(airline: "Airline B", departureTime: "1:00 PM", arrivalTime: "3:00 PM", price: 150.0, duration: "2h"),
            Flight(airline: "Airline C", departureTime: "4:00 PM", arrivalTime: "6:00 PM", price: 250.0, duration: "2h")
        ]
    }
}

struct FlightScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        FlightScheduleView(country: "Example Country")
            .environmentObject(FlightDataModel()) // Provide the environment object for preview
    }
}
