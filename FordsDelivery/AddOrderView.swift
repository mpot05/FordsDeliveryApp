//
//  AddOrderView.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import SwiftUI

struct AddOrderView: View {
    @State var itemName: String = ""
    @State var itemQuantity: Int = 0
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
            TextField("Quantity", value: $itemQuantity, formatter: NumberFormatter()).textFieldStyle(.roundedBorder).padding(.horizontal)
            
            Button(action: {
                if (itemName != "" && itemQuantity >= 1) {
                    let order = OrderInfo(itemName: itemName, itemQuantity: itemQuantity, id: UUID().uuidString)
                    orderVM.saveOrderDataToDataBase(orderInfo: order)
                    itemName = ""
                    itemQuantity = 0
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
