//
//  KnowledgeDropView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 6/19/23.
//

import SwiftUI

struct KnowledgeDropView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    
                    //manual search field
                    HStack(){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.gray)

                        
                        
                        
                    }
                    .frame(width: 370, height: 33)
                    .background(.white)
                    
                    .cornerRadius(10)
                    .padding(.top, 30)
                    

                    
                    ScrollView(.vertical){
                        VStack(spacing: 13){
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, 13)

                        
                    }

             

    
            }
        }
    }
}

struct KnowledgeDropView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeDropView()
    }
}
