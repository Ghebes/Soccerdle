//
//  Store.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/24/23.
//

import StoreKit
import SwiftUI

struct CoinsStore: View {
    @State var product: Product
    @StateObject var storeKit: StoreKitManager
    @AppStorage("coins") var coinsAmount: Int = 100

    var body: some View {
        HStack(spacing: 10){
            
            VStack(spacing: 5.0){
                
                HStack{
                    Image("coins")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text(product.displayName)
                        .foregroundColor(.black)
                        .font(.custom("PT Sans Caption Bold", size: 25))
                    
                }
                
                
                
                HStack{
                    Image(product.id)
                        .resizable()
                        .frame(width: 150, height: 100, alignment: .leading)
                    
                    Spacer()
                }
            }
            .frame(width: 170, alignment: .leading)
            .padding(.leading, 10)

            Spacer()
            Text(product.displayPrice)
                .foregroundColor(.black)
                .font(.custom("PT Sans Caption Bold", size: 19))
                .padding(.leading, -60)
                .padding(.top, 40)
            
            Spacer()
            
            Button{
                Task{
                    let success = try await storeKit.purchase(product)
                    
                    print(success)
                    //determine which product was clicked
                    
                    if(success){
                        switch (product.displayName){
                        case "400 Coins":
                            coinsAmount += 400
                            break
                        case "1000 Coins":
                            coinsAmount += 1000
                            break
                        default:
                            break
                        }
                    }
                }
            }label: {
                Text("BUY")
                    .foregroundColor(.black)
                    .font(.custom("PT Sans Caption Bold", size: 25))
                    .frame(width: 100, height: 70)
                    .background(Color("correct"))
                    .cornerRadius(10, corners: .allCorners)
                    .padding(.trailing, 10)
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(Color("store"))
        .cornerRadius(10, corners: .allCorners)
        .padding(.horizontal, 20)
        
    }
}
struct Store: View {
    @Environment(\.dismiss) var dismiss: DismissAction
    @AppStorage("coins") var coinsAmount: Int = 100
    @StateObject var storeKit = StoreKitManager()
    var body: some View {
        VStack{
            HeaderView(action: dismiss, title: "Store")
            
            ForEach(storeKit.storeProducts){product in
                VStack(spacing: 20){
                    CoinsStore(product: product, storeKit: storeKit)
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
