//
//  Store.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/24/23.
//

import StoreKit
import SwiftUI

struct Store: View {
    @Environment(\.dismiss) var dismiss: DismissAction
    @AppStorage("coins") var coinsAmount: Int = 100
    @StateObject var storeKit = StoreKitManager()
    var body: some View {
        VStack{
            HeaderView(action: dismiss, title: "Store")
            
            ForEach(storeKit.storeProducts){product in
                Button{
                    Task{
                        let success = try await storeKit.purchase(product)
                        
                        //determine which product was clicked
                        if(success){
                            coinsAmount += 400
                        }
                    }
                }label: {
                    HStack{
                        Image(product.id)
                        
                        Text(product.displayName)
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color("correct"))
                            .cornerRadius(5, corners: .allCorners)
                    }
                   
            }
           
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
        .navigationBarBackButtonHidden()
    }
}

struct Store_Previews: PreviewProvider {
    static var previews: some View {
        Store()
    }
}
