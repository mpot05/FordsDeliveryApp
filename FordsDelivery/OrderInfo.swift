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
    
    
//    init(name: String, image: String, available: Bool, description: String, id: String, pointCost: Int) {
//        self.name = name
//        self.image = image
//        self.available = available
//        self.description = description
//        self.id = id
//        self.pointCost = pointCost
//    }
//    
//    //converts the data into a dictionary which is used to communicate with firebase
//    init(data: [String : Any]) {
//        self.name = data["name"] as? String ?? "FAILURE//NAME"
//        self.image = data["image"] as? String ?? "FAILURE//IMAGE"
//        self.available = data["available"] as? Bool ?? false
//        self.description = data["description"] as? String ?? "FAILURE//DESCRIPTION"
//        self.id = data["id"] as? String ?? "FAILURE//ID"
//        self.pointCost = data["pointCost"] as? Int ?? -1
//    }
//    
//    func toDictionaryValues() -> [String : Any] {
//        return [
//            "name" : self.name,
//            "image" : self.image,
//            "available" : self.available,
//            "description" : self.description,
//            "id" : self.id,
//            "pointCost" : self.pointCost
//        ]
//    }
}
