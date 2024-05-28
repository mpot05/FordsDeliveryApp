//
//  OrderViewModel.swift
//  FordsDelivery
//
//  Created by Michael Potter on 5/24/24.
//

import Foundation
import Firebase
import FirebaseCore

class OrderViewModel: ObservableObject {
    
    @Published var Orders: [OrderInfo] = []
    
    @Published var retrieved: Bool = false
    
    let db = Firestore.firestore()
    
    func getItemWithId(id: String) -> OrderInfo? {
        for i in Orders {
            if i.id == id {
                return i
            }
        }
        return nil
    }
    
    func saveOrderDataToDataBase(orderInfo: OrderInfo) {
        db.collection("orders").document(orderInfo.id).setData(orderInfo.toDictionaryValue()) {
            error in
            if let err = error {
                print(err)
            }
            else {
                print("Successfully sent data to firebase")
            }
        }
    }
    
    func retrieveOrderData() {
        db.collection("orders").getDocuments(completion: { [self] snapshot, error in
            if let err = error {
                print(err)
                return
            }
            if let ss = snapshot {
                Orders.removeAll()
                for i in ss.documents {
                    Orders.append(OrderInfo(data: i.data()))
                }
                retrieved = true
            } else {
                print("No snapshot found")
                return
            }
            
            
        })
    }
    
    func addOrderObserverToFirebase() {
        db.collection("orders").addSnapshotListener { [self] snapshot, error in
            if let err = error {
                print(err)
                return
            }
            if let ss = snapshot {
                Orders.removeAll()
                for i in ss.documents {
                    Orders.append(OrderInfo(data: i.data()))
                }
                retrieved = true
            } else {
                print("No snapshot found")
                return
            }
        }
    }
    
    func deleteOrder(orderInfo: OrderInfo) {
        db.collection("orders").document(orderInfo.id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed")
            }
        }
    }
    
//    func deleteShopItem(shopInfo: ShopInfo) {
//        db.collection("shopItems").document(shopInfo.id).delete() { err in
//            if let err = err {
//                print("Error removing document: \(err)")
//            } else {
//                print("Document successfully removed!")
//            }
//        }
//    }
    
}
