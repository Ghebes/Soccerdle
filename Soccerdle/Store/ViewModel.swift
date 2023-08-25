//
//  ViewModel.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/24/23.
//

import Foundation
import StoreKit

//Fetch Products
// Purchase Product
// Update UI / Fetch Product State

class StoreKitManager: ObservableObject {
    
    @Published var storeProducts: [Product] = []
    var success: Bool = false
    
    var updateListenerTask : Task<Void, Error>? = nil
    private let productDict: [String : String]
    
    init() {
        //check the path for the plist
        if let plistPath = Bundle.main.path(forResource: "Property List", ofType: "plist"),
           //get the list of products
           let plist = FileManager.default.contents(atPath: plistPath){
            productDict = (try? PropertyListSerialization.propertyList(from: plist, format: nil)) as? [String : String] ?? [ : ]
        }else{
            productDict = [:]
        }
        
        updateListenerTask = listenForTransactions()
        Task {
            await requestProducts()
        }
    }
    
    deinit {
        updateListenerTask?.cancel()
    }
    
    @MainActor
    func requestProducts() async {
        do{
            //using the Product static method products to retrieve the list of products
            storeProducts = try await Product.products(for: productDict.values)
            
            //iterate the "type" if there are multiple product types
        }catch{
            print(error)
            
        }
    }
    
    //listener
    func listenForTransactions() -> Task<Void, Error> {
        return Task.detached{
            //iterate through any transaction that don't come from the purchase() call
            for await result in Transaction.updates{
                do{
                    let transaction = try self.checkVerified(result)
                    
                    //finish the transaction
                    await transaction.finish()
                }catch{
                    print("failed")
                }
            }
        }
    }
    
    //call the purchase product and returns an optional transaction
    func purchase(_ product: Product) async throws -> Bool {
        //make a purchase request - optional parameters available
        let result = try await product.purchase()
        
        //check the results
        switch(result){
        case .success(let verificationResult):
            
            //Transaction will be verified for automatically using JWT (jwsRepresentation) - we can check the result
            let transaction = try checkVerified(verificationResult)
            
            //the transaction is verified, deliver the content to the user
            success = true
            
            //always finish a transaction - performance
            await transaction.finish()
            
            return success
            
        case .userCancelled, .pending :
            success = false
            return success
        default:
            success = false
            return success
        }
    }
    
    //Generics - check the verification results
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        //check if the JWS passed the StoreKit Verification
        switch result{
        case .unverified:
            //failed verification
            throw StoreError.failedVerification
            
        case .verified(let signedType):
            //the result is verified, return the unwrapped value
            return signedType
        }
    }
    
    

}




public enum StoreError: Error {
    case failedVerification
}
