//
//  SoccerdleView.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 5/13/23.
//

import SwiftUI

struct SoccerdleView: View {
    @AppStorage("coins") var coinsAmount = 0
    @FocusState private var searchingFocused: Bool
    
    @State var searchQuery = ""
    @State var searching: Bool = false
    @State var guesses = 0
    @State var showInstructions: Bool = false
    @State var coins: Int = 7
    @State var answer: Player = players.randomElement()!
    @State var won: Bool = false
    @State var hintScreen: Bool = false
    @State var hintText: String = ""
    @State var poorAlert: Bool = false
    @ObservedObject var navigationValues: NavigationValues
    var showHint: Bool {
        return hintText != ""
    }
    
    @State var revealScreen: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    @State var guessedPlayers: [Player] = []
    
    var searchingPlayers: [Player] {
        print(searchQuery)
        let searched = players.filter({$0.name.lowercased().contains(searchQuery.lowercased())})
        return searched
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    HeaderView(action: dismiss, navigationValues: navigationValues)
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
                    .focused($searchingFocused)
                    .disabled(won || guesses == 7 || showInstructions || hintScreen || showHint ? true : false)
                    .cornerRadius(10)
                    .padding(.top, 30)
                    .onTapGesture {
                        if(!won || guesses != 7 || !showInstructions || hintScreen || showHint){
                            searching = true
                            searchingFocused = true
                        }
                       
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
                    .blur(radius: searching || showInstructions || won || hintScreen || guesses == 7 || showHint ? 2 : 0)
                    .onTapGesture {
                        searching = false
                        searchingFocused = false
                        withAnimation(.easeOut(duration: 0.5)){
                            hintText = ""
                        }
                        
                    }
                    .opacity(searching ? 0.3 : 1)
                    
                    FooterView(hintScreen: $hintScreen, revealAnswerAlert: $revealScreen, showInstructions: $showInstructions)
                        .disabled(won || guesses == 7 || showInstructions || hintScreen || showHint ? true : false)
                }
                .background(Color("background"))
                
                
                

                //prefix limits number of players
                VStack{
                    ForEach(searchingPlayers.prefix(3), id: \.self) { player in
                        SearchingPlayerView(player: player)
                            .onTapGesture {
                                searchQuery = ""
                                withAnimation(.easeIn(duration: 1)){
                                    guessedPlayers.append(player)
                                    guesses += 1
                                    searching = false
                                    searchingFocused = false
                                }
                                
                            }
                        
                    }
                }
                .opacity(searching ? 1 : 0)
                .frame(height: 500, alignment: .center)
                .padding(.top, 50)
                

                //Win Screen
                winScreen
                
                //Loss Screen
                lossScreen
                
                
                //Instructions
                instructions
                
                hintAlert
                
                hint
                
                poor
                
                revealAnswer
            }
        }
        .navigationBarBackButtonHidden()
        
        
        
    }
    
    func playAgain() {
        withAnimation(.spring()){
            won = false
            guesses = 0
            guessedPlayers = []
            
            //TODO: new random player
            guard let random = players.randomElement() else {
                print("Error")
                return
            }
            answer = random
        }
    }
    
    func quit() {
        dismiss()
    }
    
    func coinsWon() -> Int {
        coins = 8 - guessedPlayers.count
        return coins
    }
    
    private var winScreen: some View{
        Group{
            if(won){
                ResultsView(won: true, text: "", amountCoins: coins, guesses: guesses, name: answer.name, playAgain: playAgain, quit: quit)
                     .shadow(radius: 3)
            }
        }
    }
    
    private var lossScreen: some View{
        Group{
            if(guesses == 7){
                ResultsView(won: false, text: "", amountCoins: 0, guesses: guesses, fromWorlde: true, name: answer.name, playAgain: playAgain, quit: quit)
                    .shadow(radius: 3)
            }
        }
    }
    
    
    private func whichHintToShow() -> String{
        var specificPostion = false, generalPostion = false, age = false, nation = false , club = false, league = false
        
        
        for player in guessedPlayers {
            if(player.specificPosition == answer.specificPosition){
                specificPostion = true
            }
            if(player.generalPosition == answer.generalPosition){
                generalPostion = true
            }
            if(player.nation == answer.nation){
                nation = true
            }
            if(player.club == answer.club){
                club = true
            }
            if(player.league == answer.league){
                league = true
            }
            if(player.age == answer.age){
                age = true
            }

        }

        //return first that is false
        if(specificPostion == false){
            return "specificPosition"
        }else if(generalPostion == false){
            return "generalPosition"
        }else if(nation == false){
            return "nation"
        }else if(league == false){
            return "league"
        }else if(club == false){
            return "club"
        }else if(age == false){
            return "age"
        }else{
            return "none"
        }
    }
    
    private var hint: some View {
        
        VStack{
            Text("Your Hint is...")
                .font(.custom("PT Sans Caption Bold", size: 24))
            
            
            Text(hintText)
                .font(.custom("PT Sans Caption", size: 20))
                .multilineTextAlignment(.center)
        }
        .frame(width: 250, height: 200)
        .background(.white)
        .cornerRadius(20)
        .opacity(showHint ? 1 : 0)
    }
    
    private var poor: some View {
        VStack{
            Text("You don't have enough coins to purchase this")
                .multilineTextAlignment(.center)
                .font(.custom("PT Sans Caption", size: 24))
                
            Spacer()
            Button(role: .cancel, action: {
                withAnimation(.easeOut(duration: 0.5)){
                    poorAlert = false
                    revealScreen = false
                }
            }, label:{
                Text("Ok")
                    .foregroundColor(Color("correct"))
                    .font(.custom("PT Sans Caption Bold", size: 25))
                    
            })
        }
        .padding(.vertical, 10)
        .frame(width: 250, height: 200, alignment: .center)
        .background(.white)
        .cornerRadius(20)
        .opacity(poorAlert ? 1 : 0)
        
            
    }
    
    private var revealAnswer: some View{
        Group{
            VStack{
                Text("Reveal Answer")
                    .font(.custom("PT Sans Caption Bold", size: 28))
                    .padding(.top, 20)
                
                Text("Would you like to reveal the answer for 75 coins?")
                    .padding([.top, .horizontal], 15)
                    .font(.custom("PT Sans Caption", size: 24))
                    .multilineTextAlignment(.center)
                Spacer()
                
                HStack(spacing: 2){
                    Button{
                        if(coinsAmount >= 75){

                            withAnimation(.spring()){
                                revealScreen = false
                                guessedPlayers.append(answer)
                                guesses += 1
                            }
                           
                            
                            coinsAmount -= 75
                        }else{
                            withAnimation(.easeOut(duration: 1)){
                                revealScreen = false
                                poorAlert = true
                            }
                        }
  
                    }label: {
                        Text("Yes")
                            .frame(width: 97, height: 62)
                            .background(Color("correct"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .font(.custom("PT Sans Caption", size: 20))
                    }
                    
                    Button{
                        withAnimation(.easeOut(duration: 1)){
                            revealScreen = false
                        }
                    }label: {
                        Text("No")
                            .frame(width: 97, height: 62)
                            .background(Color("wrong"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .font(.custom("PT Sans Caption", size: 20))
                    }
                }
                Spacer()
            }
            .background(.white)
            .cornerRadius(20)
            .frame(width: 230, height: 330)
            .opacity(revealScreen ? 1 : 0)
        }
    }
    
    private var hintAlert: some View {
        Group{
                VStack{
                    Text("Hint")
                        .font(.custom("PT Sans Caption Bold", size: 36))
                        .padding(.top, 20)
                    
                    Text("Would you like to purchase a hint for 50 coins?")
                        .padding([.top, .horizontal], 15)
                        .font(.custom("PT Sans Caption", size: 24))
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    HStack(spacing: 2){
                        Button{
                            withAnimation(.easeOut(duration: 1)){
                                hintScreen = false
                            }
                            
                            
                            
                            
                            if(coinsAmount > 50){
                                withAnimation(.spring()){
                                    coinsAmount -= 50
                                }
                                
                                //show the hint
                                let whichHint = whichHintToShow()
                                print(whichHint)
                                //specific alert for hints
                                switch (whichHint){
                                case "specificPosition":
                                    hintText = "Your player plays " + answer.specificPosition.rawValue
                                case "generalPosition":
                                    hintText = "Your player plays " + answer.generalPosition.rawValue
                                case "nation":
                                    hintText = "Your player plays for " + answer.nation.rawValue
                                case "league":
                                    hintText = "Your player plays in " + answer.league.rawValue
                                case "club":
                                    hintText = "Your player plays for " + answer.club.rawValue
                                case "age":
                                    hintText = "Your player is " + String(answer.age) + " yrs old."
                                default:
                                    hintText = "Not working"
                                }
                            }else{
                                withAnimation(.easeOut(duration: 1)){
                                    hintScreen = false
                                    poorAlert = true
                                }
                            }
                            
                            
                            
                        }label: {
                            Text("Yes")
                                .frame(width: 97, height: 62)
                                .background(Color("correct"))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.custom("PT Sans Caption", size: 20))
                        }
                        
                        Button{
                            withAnimation(.easeOut(duration: 1)){
                                hintScreen = false
                            }
                        }label: {
                            Text("No")
                                .frame(width: 97, height: 62)
                                .background(Color("wrong"))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.custom("PT Sans Caption", size: 20))
                        }
                    }
                    Spacer()
                }
                .background(.white)
                .cornerRadius(20)
                .frame(width: 230, height: 330)
                .opacity(hintScreen ? 1 : 0)
                
                
            }
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

