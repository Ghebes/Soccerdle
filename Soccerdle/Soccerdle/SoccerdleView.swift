//
//  SoccerdleView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct SoccerdleView: View {
    @AppStorage("coins") var coinsAmount = 0
    
    @State var searchQuery = ""
    @State var searching: Bool = false
    @State var guesses = 0
    @State var showInstructions: Bool = false
    
    @State var answer: Player = players[0]
    @State var won: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    @State var guessedPlayers: [Player] = []
    
    var searchingPlayers: [Player] {
        
        let searched = players.filter({$0.name.contains(searchQuery)})
        return searched
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    HeaderView(action: dismiss)
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
                        VStack(spacing: 13){
                            ForEach(guessedPlayers, id: \.self){ player in
                                
                                PlayerSoccerdleView(player: player, answer: answer)
                                    .shadow(radius: 2)
                                    .onAppear{
                                        if(player == answer){
                                            withAnimation(.spring().delay(1.0)){
                                                won = true
                                                coinsAmount += coinsWon()
                                            }
                                        }
                                    }
                                
                            }
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, 13)
                    .blur(radius: searching || showInstructions ? 2 : 0)
                    .onTapGesture {
                        searching = false
                    }
                    .opacity(searching ? 0.3 : 1)
                    
                    FooterView(showInstructions: $showInstructions)
                }
                .background(Color("background"))
                
                
                
                //z index for the people being searched for
                //limit number of people to 5 on screen
                VStack{
                    ForEach(searchingPlayers, id: \.self) { player in
                        SearchingPlayerView(player: player)
                            .onTapGesture {
                                searchQuery = ""
                                withAnimation(.easeIn(duration: 1)){
                                    guessedPlayers.append(player)
                                    searching = false
                                }
                                
                            }
                        
                    }
                }
                .opacity(searching ? 1 : 0)
                .frame(height: 500, alignment: .top)
                
                
                
                //Win Screen
                winScreen
                
                //Instructions
                instructions
                
                
                
                
                
            }
        }
        .navigationBarBackButtonHidden()
        
        
    }
    
    func playAgain() {
        withAnimation(.spring()){
            won = false
            guessedPlayers = []
            
            //TODO: new random player
            
        }
    }
    
    func quit() {
        dismiss()
    }
    
    func coinsWon() -> Int {
        return 8 - guessedPlayers.count
    }
    
    private var winScreen: some View{
       ResultsView(won: true, text: "", amountCoins: coinsWon(), playAgain: playAgain, quit: quit)
            .opacity(won ? 1 : 0)
            .shadow(radius: won ? 0 : 3)
            
        
        
        
    }
    
    ///View showing how to play Soccerdle
    private var instructions: some View {
        Group{
            
            VStack{
                HStack{
                    Text("How to Play")
                        .font(.custom("PT Sans Caption Bold", size: 32))
                        .padding(.leading, 80)
                    
                    Spacer()
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 17, height: 20, alignment: .trailing)
                        .bold()
                        .padding(.top, 5)
                        .padding(.trailing, 30)
                        .onTapGesture {
                            withAnimation(.spring()){
                                showInstructions = false
                            }
                            
                        }
                    
                    
                }
                .frame(alignment: .top)
                
                Text("The objective of the game is to guess who the player is using hints from previous attempts. The players will only be from the top 5 leagues. ")
                    .font(.custom("PT Sans Caption", size: 20))
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
                
                HStack{
                    TraitView(correct: true, attribute: .nation, input: "Argentina")
                        .padding(.leading, 28)
                    
                    Text("Means this player is from Argentina")
                        .font(.custom("PT Sans Caption", size: 20))
                        .padding(.leading, 16)
                        .multilineTextAlignment(.center)
                }
                
                HStack{
                    TraitView(correct: false, attribute: .league, input: League.premier.rawValue)
                        .padding(.leading, 28)
                    
                    Text("Means this player is NOT in the Premier League")
                        .font(.custom("PT Sans Caption", size: 20))
                        .padding(.leading, 16)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(width: 340, height: 380, alignment: .center)
            .background(.white)
            .cornerRadius(50)
            .offset(x: showInstructions ? 0 : -600, y : 0)
        }
    }
}

struct SoccerdleView_Previews: PreviewProvider {
    static var previews: some View {
        SoccerdleView()
    }
}
