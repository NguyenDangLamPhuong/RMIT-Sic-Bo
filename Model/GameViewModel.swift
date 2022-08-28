//
//  GameViewModel.swift
//  RMIT Sic Bo
//
//  Created by Mac on 28/08/2022.
//

import Foundation

class GameViewModel: ObservableObject {
    //PROPERTIES
    let dices = ["1", "2", "3", "4", "5", "6"]
    @Published  var numbers = [0, 1, 2]
    @Published  var betAmount = 10
    @Published  var score = UserDefaults.standard.integer(forKey: "score")
    @Published  var credits = 100
    
    @Published  var isChooseBet10 = true
    @Published  var isChooseBet20 = false
    
    @Published  var showEndGameModel = false
    
    //GAME LOGIC FUNCTION
    
    func animate(){
        
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
    
}
