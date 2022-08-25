//
//  ContentView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 24/08/2022.
//

import SwiftUI

struct ContentView: View {
    //PROPERTIES
     let dices = ["1", "2", "3", "4", "5", "6"]
    @State private var numbers = [0, 1, 2]
    @State private var betAmount = 10
    @State private var score = UserDefaults.standard.integer(forKey: "score")
    @State private var credits = 10
    
    @State private var isChooseBet10 = true
    @State private var isChooseBet20 = false
    
    @State private var showEndGameModel = false
    
    //GAME LOGIC FUNCTION
    
    //PLAY BUTTON LOGIC
    func playButton(){
        //change the images
        numbers = numbers.map({ _ in
            Int.random(in: 0...dices.count - 1)
        })
    }
    //WINNING LOGIC
    func checkSmallWinning(){
        //check triple dice (all three dice land on the same number, everybody loses)
        var _ = print(self.numbers[0] + self.numbers[1] + self.numbers[2] + 3)
        if numbers[0] == numbers[1] && numbers[1] == numbers[2] && numbers[2] == numbers[0]{
            playerLose()
            
        }
        else{
            //check winnings
            if numbers[0] + numbers[1] + numbers[2] + 3 >= 4 && numbers[0] + numbers[1] + numbers[2] + 3 <= 10 {
                 
                playerWin()
                if credits > score{
                    newScoreUpdating()
                }
            }
            else{
                playerLose()
                
            }
        }
    }
    func checkBigWinning(){
        //check triple dice (all three dice land on the same number, everybody loses)
        var _ = print(self.numbers[0] + self.numbers[1] + self.numbers[2] + 3)
        if numbers[0] == numbers[1] && numbers[1] == numbers[2] && numbers[2] == numbers[0]{
            playerLose()
        }
        else{
            //check winnings
            if numbers[0] + numbers[1] + numbers[2] + 3 >= 11 && numbers[0] + numbers[1] + numbers[2] + 3 <= 17 {
                
                playerWin()
                if credits > score{
                    newScoreUpdating()
                }
                
            }
            else{
                playerLose()
            }
        }
    }
    
    //PLAYER WIN
    func playerWin(){
        credits += betAmount
    }
    
    //PLAYER LOSE
    func playerLose(){
        credits -= betAmount
    }
    
    //UPDATE NEW SCORE LOGIC
    func newScoreUpdating(){
        score = credits
        UserDefaults.standard.set( score, forKey: "score" )
    }
    
    //BET LOGIC
    func bet10(){
        betAmount = 10
        isChooseBet10 = true
        isChooseBet20 = false
    }
    func bet20(){
        betAmount = 20
        isChooseBet10 = false
        isChooseBet20 = true
    }
    //GAMEO OVER LOGIC
    func isEndGame(){
        if credits <= 0 {
            showEndGameModel = true
        }
    }
    
    //RESTE GAME LOGIC
    var body: some View {
        ZStack{
            //background
            Rectangle().foregroundColor(Color("ColorDarkYellow"))
                .edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color("ColorYellow"))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all
                )
//            Rectangle().foregroundColor(Color(red:200/255, green: 143/255, blue:32/255))
//                .edgesIgnoringSafeArea(.all)
//            Rectangle().foregroundColor(Color(red: 228/255, green:195/255,blue:76/255))
//                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all
//                )
//            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorOrange")]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                //title
                HStack{
                    TitleView()
                }.scaleEffect(2)
                
                Spacer()
                
                HStack{
                    //Credits counter
                    Text("Credits: ".uppercased() + String(credits) )
                        .modifier(scoreStyle())
                    
                    Spacer()
                    
                    //Credits counter
                    Text("High Score: ".uppercased() + String(score) )
                        .modifier(scoreStyle())
                }.padding()
                
                Spacer()
                
                //Cards
                HStack{
                    Spacer()
                    
                    Image(dices[numbers[0]])
                        .resizable()
                        .modifier(diceImageModifier())
                        .aspectRatio(1, contentMode: .fit)
                    Image(dices[numbers[1]])
                        .resizable()
                        .modifier(diceImageModifier())
                        .aspectRatio(1, contentMode: .fit)
                    Image(dices[numbers[2]])
                        .resizable()
                        .modifier(diceImageModifier())
                        .aspectRatio(1, contentMode: .fit)
                    Spacer()
                }
                Spacer()
                
                //button
                HStack{
                    Button(action: {
                        //click small button to bet small
                        self.playButton()
                        
                        //check winning
                        self.checkSmallWinning()
                        
                        //Game over
                        self.isEndGame()

                    })
                    {
                     Text("Small")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing],30)
                            .background(Color.pink)
                            .cornerRadius(20)
                        
                    }
                    Button(action: {
                        //click small button to bet small
                        self.playButton()
                        
                        //check winning
                        self.checkBigWinning()
                        
                        //Game over
                        self.isEndGame()
                    })
                    {
                     Text("Big")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing],30)
                            .background(Color.pink)
                            .cornerRadius(20)
                    }
                }
                
                Spacer()
                
                HStack{
                    
                    Button {
                        self.bet20()
                    } label: {
                        HStack{
                            Text("20")
                                .modifier(BetCapsuleModifier())
                            Image("chips")
                                .resizable()
                            
                                .opacity(isChooseBet20 ? 1 : 0)
                                .modifier(ChipModifier())
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        self.bet10()
                    } label: {
                        HStack{
                            Image("chips")
                                .resizable()
                                .opacity(isChooseBet10 ? 1 : 0)
                                .modifier(ChipModifier())
                            Text("10")
                                .modifier(BetCapsuleModifier())
                        }
                    }
                }
            }
            .padding()
            .blur(radius:  showEndGameModel ? 5 : 0 , opaque: false)
            if showEndGameModel {
                ZStack{
                    Color("ColorBlackTransparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Game over")
                            .font(.system(.title, design: .rounded ))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                            .background(Color.red)
                        Spacer()
                        VStack{
                            Image("chips")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                            Text("You lost all your money!!! \n Good luck next time")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Button{
                                self.showEndGameModel = false
                                self.credits = 100
                            } label: {
                                Text("New Game" .uppercased())
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                            }
                            .background(Capsule().fill(.red))
                            
                        }
                        Spacer()
                    }
                    
                        
                }
                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                .background(Color.blue)
                .cornerRadius(20)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
