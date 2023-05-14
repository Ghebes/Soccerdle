//
//  SoccerdleView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct SoccerdleView: View {
    @State var searchQuery = ""
    @State var searching: Bool = false
    
    var guessedPlayers = [Player]()
    
    var body: some View {
        NavigationView {
            VStack{
                
                
                HeaderView()
                    .frame(alignment: .top)
                
                //manual search field
                HStack(){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchQuery)
                        .frame(width: 300, height: 33)
                        .padding(.leading, 20)
                    
                    
                    
                }
                .frame(width: 370, height: 33)
                .background(.white)
                .cornerRadius(10)
                .padding(.top, 30)
                .onTapGesture {
                    searching = true
                }
                .shadow(radius: searching ? 4 : 0)
                
                ScrollView(.vertical){
                    
                    
                    
                        
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                FooterView()
            }
            .background(Color("background"))
        }
        .navigationBarBackButtonHidden()
        
        
    }
}

struct SoccerdleView_Previews: PreviewProvider {
    static var previews: some View {
        SoccerdleView()
    }
}
