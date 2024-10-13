//
//  FlightAPI.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/12/24.
//

import Foundation

class FlightAPI {
    static func getFlights(from country: String, on date: String, completion: @escaping ([Flight]) -> Void) {
        let apiKey = "YOUR_API_KEY"
        let formattedCountry = country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? country
        let apiURL = "https://api.example.com/flights?country=\(formattedCountry)&date=\(date)&apikey=\(apiKey)"
        
        guard let url = URL(string: apiURL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching flights: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let flightData = try JSONDecoder().decode([Flight].self, from: data)
                completion(flightData)
            } catch {
                print("Error decoding flight data: \(error)")
            }
        }
        task.resume()
    }
}
