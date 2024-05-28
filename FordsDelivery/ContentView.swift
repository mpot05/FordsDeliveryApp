//
//  ContentView.swift
//  FordsDelivery
//
//  Created by Christopher Walter on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var orderVM: OrderViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink("Add order", destination: AddOrderView())
                    NavigationLink("List orders", destination: ListOfOrdersView())
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(OrderViewModel())
        .preferredColorScheme(.dark)
}
