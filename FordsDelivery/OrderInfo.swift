//
//  OrderInfo.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import Foundation
import Firebase
import FirebaseCore

class OrderInfo: ObservableObject, Identifiable {
    
    @Published var itemName: String
    @Published var itemQuantity: Int
    @Published var id: String
    
    init(itemName: String, itemQuantity: Int, id: String) {
        self.itemName = itemName
        self.itemQuantity = itemQuantity
        self.id = id
    }
    
    init(data: [String : Any]) {
        self.itemName = data["itemName"] as? String ?? "FAILURE//ITEMNAME"
        self.itemQuantity = data["itemQuantity"] as? Int ?? -1
        self.id = data["id"] as? String ?? "FAILURE//ID"
    }
    
    func toDictionaryValue() -> [String : Any] {
        return [
            "itemName" : self.itemName,
            "itemQuantity" : self.itemQuantity,
            "id" : self.id
        ]
    }
    
}
