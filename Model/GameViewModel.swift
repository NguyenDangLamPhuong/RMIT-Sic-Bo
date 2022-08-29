//
//  GameViewModel.swift
//  RMIT Sic Bo
//
//  Created by Mac on 28/08/2022.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    //PROPERTIES
    let dices = ["1", "2", "3", "4", "5", "6"]
    @Published var numbers = [0, 1, 2]
    @Published var betAmount = 10
    @Published var score = UserDefaults.standard.integer(forKey: "score")
    @Published var currentCredits = UserDefaults.standard.integer(forKey: "currentCredits")
    @Published var credits = 100
    @Published var username = UserDefaults.standard.string(forKey: "username")
    @Published var highscore = UserDefaults.standard.integer(forKey: "highscore")
    
    //@Published var oldScore = UserDefaults.standard.integer(forKey: "oldscore")
    @Published var existUsername = ""
    @Published var newScore = 0
    @Published var user_list : [String: String] = UserDefaults.standard.object(forKey: "user") as? [String: String] ?? [:]

    
    @Published var isChooseBet10 = true
    @Published var isChooseBet20 = false
    
    @Published var showEndGameModel = false
    @Published var askContinue = false
    
    //GAME LOGIC FUNCTION
    
    //get user name
    func getUserName(){
        username = existUsername
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(score, forKey: "score")
    }
    
    
    //check exist user name
    func checkExistUser(){
        getUserName()
        let keyExists = user_list[username!] != nil
    
        if keyExists {
            askContinue = true
            print("existed user")
            
        } else {
            askContinue = false
            print("new user")
            user_list[username!] = String(newScore)
            UserDefaults.standard.set(user_list, forKey: "user")
            // highscore ==0 if player is new
            highscore = 0
            UserDefaults.standard.set( highscore, forKey: "highscore" )
            isNewGame()
        }
        
    }
    
    func isContinue(){
        let currentHighScore = Int(user_list[username!]!)!

        if (currentHighScore < highscore) {
            user_list[username!] = String(highscore)
            UserDefaults.standard.set(user_list, forKey: "user")
            
        }
        else{
            UserDefaults.standard.set(highscore, forKey: "currentCredits")
        }
        
        print(currentCredits)
    }
    func isNewGame(){
        currentCredits = 100
        UserDefaults.standard.set(currentCredits, forKey: "currentCredits")
        
    }
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
                if currentCredits > highscore{
                    newHighScoreUpdating()
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
                if currentCredits > highscore{
                    newHighScoreUpdating()
                }
                
            }
            else{
                playerLose()
            }
        }
    }
    //WINNING LOGIC
    func checkHardWinning(){
        //check triple dice (all three dice land on the same number, player wins)
        var _ = print(self.numbers[0] + self.numbers[1] + self.numbers[2] + 3)
        if numbers[0] == numbers[1] && numbers[1] == numbers[2] && numbers[2] == numbers[0]{
            //player wins
            playerWin()
            if currentCredits > highscore{
                newHighScoreUpdating()
            }
            
        }
        else{
            //player loses
            playerLose()
        }
    }
    
    //PLAYER WIN
    func playerWin(){
        playSound(sound: "win", type: "wav")
        credits += betAmount
        currentCredits += betAmount
        UserDefaults.standard.set(currentCredits, forKey: "currentCredits")
      
    }
    
    //PLAYER LOSE
    func playerLose(){
        playSound(sound: "lose", type: "mp3")
        credits -= betAmount
        score = currentCredits
        currentCredits -= betAmount
        UserDefaults.standard.set(currentCredits, forKey: "currentCredits")

    }
    
    //UPDATE NEW SCORE LOGIC
    func newScoreUpdating(){
        score = currentCredits
        UserDefaults.standard.set( score, forKey: "score" )
    }
    //UPDATE NEW SCORE LOGIC
    func newHighScoreUpdating(){
        highscore = currentCredits
        UserDefaults.standard.set( highscore, forKey: "highscore" )
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
        if currentCredits <= 0 {
            showEndGameModel = true
            playSound(sound: "game-over", type: "wav")
        }
    }
    
    
}
