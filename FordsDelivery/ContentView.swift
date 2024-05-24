//
//  ContentView.swift
//  FordsDelivery
//
//  Created by Christopher Walter on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var itemName: String = ""
    @State var itemQuantity: Int = 0
    @State var id: String = ""
    @EnvironmentObject var orderVM: OrderViewModel
    
    var body: some View {
        NavigationStack {
                List {
                    NavigationLink("Add order", destination: AddOrderView())
                    NavigationLink("List orders", destination: ListOfOrdersView())
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(OrderViewModel())
}
