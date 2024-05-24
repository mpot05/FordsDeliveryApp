//
//  IndividualOrderView.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import SwiftUI

struct IndividualOrderView: View {
    @EnvironmentObject var orderVM: OrderViewModel
    @StateObject var order: OrderInfo
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Text("Item Name: \(order.itemName)")
                .font(.largeTitle)
            Text("Number of this item: \(order.itemQuantity)")
                .font(.largeTitle)
            Text("ID String: \(order.id)")
            Spacer()
            Button(action: {
                orderVM.deleteOrder(orderInfo: order)
                dismiss()
            }, label: {
                Text("Delete this order")
            })
        }
    }
}

#Preview {
    IndividualOrderView(order: OrderInfo(itemName: "Test", itemQuantity: 50, id: UUID().uuidString))
        .environmentObject(OrderViewModel())
}
