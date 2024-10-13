//
//  CountrySelectionView.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/12/24.
//
// This is still building

import SwiftUI

struct CountrySelectionView: View {
    let countries = ["Greece", "Italy", "Japan"]
    let countryImages = ["greece", "italy", "japan"] // Removed file extensions
    
    var body: some View {
        NavigationView {
            List(0..<countries.count, id: \.self) { index in
                NavigationLink(destination: FlightScheduleView(country: countries[index])) {
                    HStack {
                        Image(countryImages[index])
                            .resizable()
                            .scaledToFit() // Maintain aspect ratio
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(countries[index])
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Select a Country")
        }
    }
}

struct CountrySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CountrySelectionView()
    }
}
