//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by นางสาวพรนัชชา ประทีปสังคม on 19/3/2568 BE.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var restaurant: Restaurant
    var body: some View {
        ZStack(alignment: .top){
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .frame(height: 100)
                .opacity(0.8)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay{
                    VStack(spacing: 5) {
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                    }
                }
                .font(.system(.headline,design: .rounded))
                .foregroundStyle(.white)
            }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement:
                    .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("\(Image(systemName: "chevron.left"))\(restaurant.name)").foregroundStyle(.white)
                        }
                    }
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(
        name: "Cafe Deadend", type: "Coffee & Tea Shop",
                    location: "Hong Kong", image: "cafedeadend", isFavorite: false))
    
}
