/**
 Testing
 */
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct GuessWhoView: View {
    //private let adViewControllerRepresentable = AdViewControllerRepresentable()
    //private let adCoordinator = AdCoordinator()
    
    @Environment(\.dismiss) var dismiss: DismissAction
    @State var level: Level = LevelInformation().levels[0]
    @AppStorage("level") var currentLevel: Int = 1
    @AppStorage("coins") var coinsAmount: Int = 1000
    @State var nextLevel: Level = LevelInformation().levels[0]
    
    @State var addedCoins: Int = 0
    
    //Guessing Letter Variables
    @State var guesses: [LetterType] = Array(repeating: LetterType(character: Character(" ")), count: 5)
    
    //Letter Bank Variables
    @State var allLetters: [LetterType] = AllCharacters().allCharacters
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 7)
    @State var clickedArray: [Bool] = Array(repeating: false, count: 14)
    
    //Image State Variables
    @State var hide: [Bool] = Array(repeating: false, count: 9)
    @State var imagesRemoved: Int = 0
    
    //Won
    @State var won: Bool = true
    @State var incorrect: Bool = false
    
    //Hint
    @State var showHint: Bool = false
    
    //Poor
    @State var isPoor: Bool = false
    
    //Reveal
    @State var showAnswer: Bool = false
    
    //Instructions
    @State var showInstructions: Bool = false
    
    private var notEnoughMoneyScreen: some View {
        
        VStack{
            Text("You don't have enough coins to purchase this")
                .multilineTextAlignment(.center)
                .font(.custom("PT Sans Caption", size: 24))
            
            Spacer()
            Button(role: .cancel, action: {
                withAnimation(.easeOut(duration: 0.5)){
                    isPoor = false
                    showAnswer = false
                    showHint = false
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
        
    }
    private var hintScreen: some View {
        VStack{
            Text("Are you sure you want to spend 25 coins for a hint?")
                .foregroundColor(.black)
                .font(.custom("PT Sans Caption Bold", size: 25))
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
            
            HStack{
                Button{
                    
                    if(coinsAmount >= 25){
                        
                        coinsAmount -= 25

                        //get a random letter that has not been completed yet
                        
                        var leftToDo: [Int] = []
                        for index in guesses.indices {
                            if(guesses[index].character == " "){
                                leftToDo.append(index)
                            }
                        }
                        
                        guard let randomIndex = leftToDo.randomElement() else {
                            print("ERROR")
                            return
                        }
                        
                        guesses[randomIndex] = level.letters[randomIndex]
                        
                        showHint = false

                    }else{
                        
                        isPoor = true
                        showHint = false
                    }
                }label: {
                    Text("YES")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("correct"))
                .cornerRadius(10)
                .padding(.leading, 10)
                
                
                Button{
                    withAnimation(.easeOut(duration: 1)){
                        showHint = false
                    }
                }label: {
                    Text("NO")
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("wrong"))
                .cornerRadius(10)
                .padding(.trailing, 10)
            }
            
        }
        .frame(width: 225, height: 250)
        .background(.white)
        .cornerRadius(30)
        .offset(y: -30)
        .opacity(showHint ? 1 : 0)
        
    }
    
    private var revealAnswerScreen: some View {
        VStack{
            Text("Are you sure you want to spend 50 coins to reveal the answer?")
                .foregroundColor(.black)
                .font(.custom("PT Sans Caption Bold", size: 25))
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 10){
                Button{
                    if(coinsAmount >= 50){
                        coinsAmount -= 50
                        
                        guesses = level.letters
                        
                        showAnswer = false
                    }else{
                        withAnimation(.easeIn(duration: 1)){
                            showAnswer = false
                            isPoor = true
                        }
                        
                    }
                    
                    
                    
                }label: {
                    Text("YES")
                        .foregroundColor(.white)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("correct"))
                .cornerRadius(10)
                .padding(.leading, 10)
                
                Button{
                    showAnswer = false
                }label: {
                    Text("NO")
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("wrong"))
                .cornerRadius(10)
                .padding(.trailing, 10)
            }
        }
        .frame(width: 225 , height: 250)
        .background(.white)
        .cornerRadius(30)
        .offset(y: -30)
        .opacity(showAnswer ? 1 : 0)
        
    }
    
    private func calculateCoins() {
        addedCoins = 9 - imagesRemoved
        coinsAmount += addedCoins
    }
    
    private var winScreen: some View {
        return Group{
            
            VStack(spacing: 5){
                HStack(alignment: .center){
                    Text("+" + String(addedCoins))
                        .foregroundColor(Color("correct"))
                        .font(.custom("PT Sans Caption Bold", size: 34))
                    
                    Image("coins")
                        .resizable()
                        .foregroundColor(Color("correct"))
                        .frame(width: 30, height: 30)
                }
                
                Text("Correct!!!")
                    .foregroundColor(Color("correct"))
                    .padding(.horizontal, 10)
                    .font(.custom("PT Sans Caption Bold", size: 36))
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 4)
                            .foregroundColor(Color("correct"))
                    }
                
                Image("balloons")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                
                
                
                
                
            }
            .frame(width: 225, height: 350)
            .background(.white)
            .cornerRadius(50)
            .opacity(won ? 1 : 0)
            .onAppear{
                if(currentLevel < LevelInformation().levels.count){
                    nextLevel = LevelInformation().levels[currentLevel]
                    
                }
            }
            
        }
    }
    
    private var instructions: some View {
        VStack{
            HStack{
                Text("How to Play")
                    .font(.custom("PT Sans Caption Bold", size: 30))
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
            
            Text("The objective of the game is to guess who the player is using the disappearing image in the center of the screen. The faster you answer correctly, the more coins that you receive. If you get stuck, there are support buttons at the bottom of the screen.")
                .font(.custom("PT Sans Caption", size: 17))
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
            
            
            
            
        }
        .frame(width: 340, height: 280, alignment: .center)
        .background(.white)
        .cornerRadius(50)
        .opacity(showInstructions ? 1 : 0)
        
    }
    func guessesFilled() -> Bool {
        for guess in guesses {
            if(guess.character == " "){
                
                return false
            }
        }
        
        return true
    }
    
    
    private func checkWon() {
        //check the values of the guess.character
        for index in guesses.indices{
            if(guesses[index].character != level.letters[index].character){
                incorrect = true
                won = false
  
                return
            }
        }
        
        withAnimation(.easeIn(duration: 1)){
            won = true
        }
        calculateCoins()
        incorrect = false
        currentLevel += 1
    }
    
    func amountFilled() -> Int {
        var count = 0
        
        for guess in guesses {
            if(guess.character != " "){
                count += 1
            }
        }
        
        return count
    }
    
    var body: some View {
        ZStack {
            VStack{
                
                //MARK: HeaderView
                HeaderView(coinsAmount: coinsAmount, action: dismiss, title: "Guess Who")
                
                
                DisappearingImageView(level: $level, hide: $hide, imagesRemoved: $imagesRemoved, won: $won, showAnswer: $showAnswer)
                
                //GuessingLetters
                HStack(spacing: 10){
                    ForEach(level.letters.indices){ index in
                        GuessingLetter(guesses: $guesses, position: index)
                    }
                }
                .padding(.top, 10)
                
                HStack(spacing: 10){
                    LazyVGrid(columns: columns){
                        ForEach(allLetters.indices) { index in
                            NormalLetter(letter: allLetters[index], clicked: $clickedArray[index], guessesFilled: guessesFilled(), guesses: $guesses)
                        }
                    }
                    .frame(width: 330)
                    
                    VStack{
                        Image(systemName: "delete.left")
                            .resizable()
                            .frame(width: 20, height: 25)
                    }
                    .foregroundColor(.white)
                    .frame(width: 40, height: 80)
                    .background(Color("wrong"))
                    .cornerRadius(10)
                    .onTapGesture {
                        if(amountFilled() != 0){
                            let letterRemoved = guesses.last(where: {$0.character != " "})!
                            
                            let guessIndex = guesses.firstIndex(where: {$0.id == letterRemoved.id})!
                            
                            guesses[guessIndex].character = " "
                            
                            guard let letterIndex = allLetters.firstIndex(where: {$0.id == letterRemoved.id}) else {
                                print("ERROR")
                                return
                            }
                            
                            clickedArray[letterIndex] = false
                        }
                    }
                }
                .padding(.top, 15)
                
                Button{
                   //adCoordinator.loadAd()
                    
                   //adCoordinator.presentAd(from: adViewControllerRepresentable.viewController)
                }label: {
                    Text("Ad test")
                }
                Spacer()
                
                FooterView(hintScreen: $showHint, revealAnswerAlert: $showAnswer, showInstructions: $showInstructions)
            }
            .onChange(of: amountFilled()){newValue in

                if(newValue == level.letters.count){
                    checkWon()
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("background"))
            .background {
               //adViewControllerRepresentable.frame(width: .zero, height: .zero)
            }
            
            hintScreen
            revealAnswerScreen
            instructions
            if(won){
                CustomAlert(shown: $won, addedCoins: $addedCoins)
            }
        }
        .navigationBarBackButtonHidden()
        

        
    }
    
}
