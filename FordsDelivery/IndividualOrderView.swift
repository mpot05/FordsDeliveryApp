//
//  IndividualOrderView.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import SwiftUI

struct IndividualOrderView: View {
    @EnvironmentObject var orderVM: OrderViewModel
    @StateObject var order: OrderModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Text("Item Name: \(order.itemName)")
                .font(.largeTitle)
            Text("Number of this item: \(order.quantity ?? 1)")
                .font(.largeTitle)
            Text("Created: \(order.created.dateValue().formatted())")
            Text("ID String: \(order.id)")
            Spacer()
            Button(action: {
                orderVM.deleteOrder(orderModel: order)
                dismiss()
            }, label: {
                Text("Delete this order")
            })
        }
    }
}

#Preview {
    IndividualOrderView(order: OrderModel(itemName: "Test", quantity: 50, id: UUID().uuidString))
        .environmentObject(OrderViewModel())
}
