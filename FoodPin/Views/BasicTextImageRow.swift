//
//  BasicTextImageRow.swift
//  FoodPin
//
//  Created by นางสาวพรนัชชา ประทีปสังคม on 19/3/2568 BE.
//

import SwiftUI

struct BasicTextImageRow: View {
    @Binding var restaurant: Restaurant
    @State private var showOptions = false
    @State private var showError = false
    
    
    var body: some View {
        HStack(alignment: .top){
            Image(restaurant.image)
                .resizable()
                .frame(width: 120,height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
            }
            if restaurant.isFavorite {
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
        }
        
        /*.onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog(
            "What do you want to do?",
            isPresented: $showOptions,
            titleVisibility: .visible
        ){
            Button("Reserve a table"){
                showError.toggle()
            }
            Button(restaurant.isFavorite ? "Remove from favoraite" : "Mark as favorite") {
                restaurant.isFavorite.toggle()
            }
        }*/
        .alert("Not yet available", isPresented: $showError){
            
        } message: {
            Text("Sorry, this feature is not available yest. Please retry later.")
        }
        .contextMenu {
            Button {
                showError.toggle()
            } label: {
                Text("Reserve a Table")
                Image(systemName: "phone")
            }
            Button{
                restaurant.isFavorite.toggle()
            } label: {
                Text(restaurant.isFavorite ? "Remove from favoraite" : "Mark as favorite")
                Image(systemName: "heart")
            }
            Button{
                showOptions.toggle()
            } label: {
                
                Text("Share")
                Image(systemName: "square.and.arrow.up")
            }
        }
        .sheet(isPresented: $showOptions) {
            let defaultText = "Just checking in at \(restaurant.name)"
            if let imageToShare = UIImage(named:
                restaurant.image) {
                ActivityView(activityItem: [defaultText, imageToShare])
            }else {
                ActivityView(activityItem: [defaultText])
                
            }
        }
    }
}

#Preview {
    BasicTextImageRow(restaurant: .constant(Restaurant(
        name: "Cafe Deadend", type: "Coffee & Tea Shop",
                    location: "Hong Kong", image: "cafedeadend", isFavorite: false)))
}
