//
//  OrderInfo.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import Foundation
import Firebase
import FirebaseCore

class OrderModel: ObservableObject, Identifiable {
    
    @Published var itemName: String
    @Published var quantity: Int?
    @Published var created: Timestamp
    @Published var id: String
    
    init(itemName: String, quantity: Int? = nil, created: Timestamp = Timestamp(), id: String = UUID().uuidString) {
        self.itemName = itemName
        self.quantity = quantity
        self.created = created
        self.id = id
    }
    
    init(data: [String : Any]) {
        self.itemName = data["itemName"] as? String ?? "FAILURE//ITEMNAME"
        self.quantity = data["quantity"] as? Int ?? 1
        self.id = data["id"] as? String ?? "FAILURE//ID"
        self.created = data["created"] as? Timestamp ?? Timestamp()
    }
    
    func toDictionaryValue() -> [String : Any] {
        return [
            "itemName" : self.itemName,
            "quantity" : self.quantity ?? 1,
            "created" : Timestamp(date: created.dateValue()),
            "id" : self.id
        ]
    }
    
}
