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
    
    @Published var Orders: [OrderModel] = []
    
    @Published var retrieved: Bool = false
    
    let db = Firestore.firestore()
    
    func getItemWithId(id: String) -> OrderModel? {
        for i in Orders {
            if i.id == id {
                return i
            }
        }
        return nil
    }
    
    func saveOrderDataToDataBase(orderModel: OrderModel) {
        db.collection("orders").document(orderModel.id).setData(orderModel.toDictionaryValue()) {
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
                    Orders.append(OrderModel(data: i.data()))
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
                    Orders.append(OrderModel(data: i.data()))
                }
                retrieved = true
            } else {
                print("No snapshot found")
                return
            }
        }
    }
    
    func deleteOrder(orderModel: OrderModel) {
        db.collection("orders").document(orderModel.id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed")
            }
        }
    }
    
}
