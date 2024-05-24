//
//  ListOfOrdersView.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import SwiftUI
import Firebase
import FirebaseCore

struct ListOfOrdersView: View {
    @EnvironmentObject var orderVM: OrderViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Orders:")
                    .font(.largeTitle)
                List {
                    ForEach(orderVM.Orders) { order in
                        NavigationLink("\(order.itemName)", destination: IndividualOrderView(order: order))
                    }
                }
            }.onAppear {
                orderVM.retrieveOrderData()
            }
        }
    }
}

#Preview {
    ListOfOrdersView()
        .environmentObject(OrderViewModel())
}
