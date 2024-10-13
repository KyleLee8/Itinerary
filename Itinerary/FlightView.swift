//
//  SchedulerView.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/10/24.
//
import SwiftUI

struct FlightView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: CountrySelectionView()) {
                    Text("Select a Country for Flights")
                        .font(.largeTitle)
                        .padding()
                }
                
                NavigationLink(destination: ItineraryView()) {
                    Text("View Your Itinerary")
                        .font(.title)
                        .padding()
                }
            }
            .navigationTitle("Flight Scheduler")
        }
    }
}

struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView()
    }
}
