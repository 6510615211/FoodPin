//
//  ContentView.swift
//  FoodPin
//
//  Created by นางสาวพรนัชชา ประทีปสังคม on 19/3/2568 BE.
//

import SwiftUI

struct RestaurantListView: View {
    @State var restaurants = [
            Restaurant(
                name: "Cafe Deadend", type: "Coffee & Tea Shop",
                location: "Hong Kong", image: "cafedeadend", isFavorite: false),
            Restaurant(
                name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei",
                isFavorite: false),
            Restaurant(
                name: "Teakha", type: "Tea House", location: "Hong Kong",
                image: "teakha", isFavorite: false),
            Restaurant(
                name: "Cafe loisl", type: "Austrian / Causual Drink",
                location: "Hong Kong", image: "cafeloisl", isFavorite: false),
            Restaurant(
                name: "Petite Oyster", type: "French", location: "Hong Kong",
                image: "petiteoyster", isFavorite: false),
            Restaurant(
                name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong",
                image: "forkee", isFavorite: false),
            Restaurant(
                name: "Po's Atelier", type: "Bakery", location: "Hong Kong",
                image: "posatelier", isFavorite: false),
            Restaurant(
                name: "Bourke Street Backery", type: "Chocolate",
                location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
            Restaurant(
                name: "Haigh's Chocolate", type: "Cafe", location: "Sydney",
                image: "haigh", isFavorite: false),
            Restaurant(
                name: "Palomino Espresso", type: "American / Seafood",
                location: "Sydney", image: "palomino", isFavorite: false),
            Restaurant(
                name: "Upstate", type: "American", location: "New York",
                image: "upstate", isFavorite: false),
            Restaurant(
                name: "Traif", type: "American", location: "New York",
                image: "traif", isFavorite: false),
            Restaurant(
                name: "Graham Avenue Meats", type: "Breakfast & Brunch",
                location: "New York", image: "graham", isFavorite: false),
            Restaurant(
                name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York",
                image: "waffleandwolf", isFavorite: false),
            Restaurant(
                name: "Five Leaves", type: "Coffee & Tea", location: "New York",
                image: "fiveleaves", isFavorite: false),
            Restaurant(
                name: "Cafe Lore", type: "Latin American", location: "New York",
                image: "cafelore", isFavorite: false),
            Restaurant(
                name: "Confessional", type: "Spanish", location: "New York",
                image: "confessional", isFavorite: false),
            Restaurant(
                name: "Barrafina", type: "Spanish", location: "London",
                image: "barrafina", isFavorite: false),
            Restaurant(
                name: "Donostia", type: "Spanish", location: "London",
                image: "donostia", isFavorite: false),
            Restaurant(
                name: "Royal Oak", type: "British", location: "London",
                image: "royaloak", isFavorite: false),
            Restaurant(
                name: "CASK Pub and Kitchen", type: "Thai", location: "London",
                image: "cask", isFavorite: false),
        ]
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants.indices, id: \.self) { index in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])){
                        BasicTextImageRow(restaurant: $restaurants[index])
                    }
                }
                .onDelete{
                    IndexSet in restaurants.remove(atOffsets: IndexSet)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
}

#Preview {
    RestaurantListView()
}

#Preview("Dark mode"){
    RestaurantListView()
        .preferredColorScheme(.dark)
}
