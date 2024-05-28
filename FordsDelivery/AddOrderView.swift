//
//  AddOrderView.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import SwiftUI

struct AddOrderView: View {
    @State var itemName: String = ""
    @State var quantity: Int = 0
    @State var id: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var orderVM: OrderViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Item Name:")
                Spacer()
            }.padding(.horizontal)
            TextField("Name", text: $itemName).textFieldStyle(.roundedBorder).padding(.horizontal).padding(.bottom, 25)
            HStack {
                Text("Item Quantity:")
                Spacer()
            }.padding(.horizontal)
            TextField("Quantity", value: $quantity, formatter: NumberFormatter()).textFieldStyle(.roundedBorder).padding(.horizontal)
            
            Button(action: {
                if (itemName != "" && quantity >= 1) {
                    let order = OrderModel(itemName: itemName, quantity: quantity)
                    orderVM.saveOrderDataToDataBase(orderModel: order)
                    itemName = ""
                    quantity = 0
                    dismiss()
                }
            }, label: {
                Text("Add order")
            })
        }
    }
}

#Preview {
    AddOrderView()
}
