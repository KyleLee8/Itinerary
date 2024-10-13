//
//  ContentView.swift
//  Itinerary
//
//  Created by Kyle Lee on 10/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "line.horizontal.3.decrease")
                            .resizable().frame(width: 24, height: 24)
                        Spacer()
                        Text("Los Angeles").font(.system(.headline, design: .rounded))
                        Text("California").fontWeight(.ultraLight)
                        Spacer()
                        Image("photo").resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 36, height:36)
                            .clipShape(Circle())
                    }
                    
                    VStack (alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Hi").font(.largeTitle)
                            Text("User").font(.largeTitle).fontWeight(.heavy)
                        }
                        Text("Lets find out new things").font(.subheadline).fontWeight(.light)
                    }
                    
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color(UIColor.systemIndigo))
                                .padding()
                            
                            Text("Search Hotels, Restaurants, etc...")
                                .font(.footnote)
                                .padding()
                            Spacer()
                            Divider().frame(height: 24)
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame (width: 8, height: 8)
                                .padding()
                        }
                        .foregroundStyle(Color.secondary.opacity(0.5))
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(80)
                        .shadow(radius: 1)
                        .padding()
                    }
                    
                    HStack {
                        VStack {
                            NavigationLink(destination: FlightView()) {
                                Image(systemName: "airplane.circle")
                                    .foregroundStyle(.white)
                                    .scaleEffect(2)
                                    .padding(.all,18)
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(16)
                                    .shadow(radius: 2)
                            }
                            Text("Flights").font(.footnote).bold()
                        }
                        .padding(.horizontal, 16)
                        Spacer()
                        VStack {
                            NavigationLink(destination: FoodView()) {
                                Image(systemName: "fork.knife.circle")
                                    .foregroundStyle(.white)
                                    .scaleEffect(2)
                                    .padding(.all,18)
                                    .background(Color.orange.opacity(0.8))
                                    .cornerRadius(16)
                                    .shadow(radius: 2)
                            }
                            Text("Foods").font(.footnote).bold()
                        }
                        .padding(.horizontal, 16)
                        Spacer()
                        VStack {
                            NavigationLink(destination: HotelView()) {
                                Image(systemName: "bed.double.circle")
                                    .foregroundStyle(.white)
                                    .scaleEffect(2)
                                    .padding(.all,18)
                                    .background(Color.gray.opacity(0.8))
                                    .cornerRadius(16)
                                    .shadow(radius: 2)
                            }
                            Text("Hotels").font(.footnote).bold()
                        }
                        .padding(.horizontal, 16)
                        Spacer()
                        VStack {
                            // Remove Button inside NavigationLink
                            NavigationLink(destination: SchedulerView()) {
                                Image(systemName: "calendar.badge.clock")
                                    .foregroundStyle(.white)
                                    .scaleEffect(2)
                                    .padding(.all,18)
                                    .background(Color.red.opacity(0.8))
                                    .cornerRadius(16)
                                    .shadow(radius: 2)
                            }
                            Text("Scheduler").font(.footnote).bold()
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 60)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
