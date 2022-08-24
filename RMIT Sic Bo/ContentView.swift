//
//  ContentView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 24/08/2022.
//

import SwiftUI

struct ContentView: View {
    private var dices = ["1", "2", "3", "4", "5", "6"]
    @State private var numbers = [0, 1, 2]
    private var betAmount = 10

    @State private var credits = 1000
    var body: some View {
        ZStack{
            //background
            Rectangle().foregroundColor(Color(red:200/255, green: 143/255, blue:32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color(red: 228/255, green:195/255,blue:76/255))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all
                )
            VStack{
                Spacer()
                //title
                HStack{
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("RMIT Sic Bo").bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                //Credits counter
                Text("Credits: " + String(credits) )
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20
                    )
                Spacer()
                //Cards
                HStack{
                    Spacer()
                    
                    Image(dices[numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white)
                        .opacity(0.5)
                        .cornerRadius(20)
                    Image(dices[numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white)
                        .opacity(0.5)
                        .cornerRadius(20)
                    Image(dices[numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white)
                        .opacity(0.5)
                        .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                
                //button
                HStack{
                    Button(action: {
                        //change the images
                        self.numbers[0] = Int.random(in: 0...self.dices.count-1)
                        self.numbers[1] = Int.random(in: 0...self.dices.count-1)
                        self.numbers[2] = Int.random(in: 0...self.dices.count-1)
                        
                        //check triple dice (all three dice land on the same number, everybody loses)
                        if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] && self.numbers[2] == self.numbers[0]{
                            
                            //lose
                            self.credits -= self.betAmount
                        }
                        else{
                            //check winnings
                            if self.numbers[0] + self.numbers[1] + self.numbers[2] >= 4 && self.numbers[0] + self.numbers[1] + self.numbers[2] <= 10 {
                                 
                                //won
                                self.credits += self.betAmount * 10
                            }
                            else{
                                //lose
                                self.credits -= self.betAmount
                            }
                        }
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
                        
                        //change the images
                        self.numbers[0] = Int.random(in: 0...self.dices.count-1)
                        self.numbers[1] = Int.random(in: 0...self.dices.count-1)
                        self.numbers[2] = Int.random(in: 0...self.dices.count-1)
                        
                        //check triple dice (all three dice land on the same number, everybody loses)
                        if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] && self.numbers[2] == self.numbers[0]{
                            
                            //lose
                            self.credits -= self.betAmount
                        }
                        else{
                            //check winnings
                            if self.numbers[0] + self.numbers[1] + self.numbers[2] >= 11 && self.numbers[0] + self.numbers[1] + self.numbers[2] <= 17 {
                                 
                                //won
                                self.credits += self.betAmount * 10
                            }
                            else{
                                //lose
                                self.credits -= self.betAmount
                            }
                        }
                        
                    })
                    {
                     Text("Biggg")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing],30)
                            .background(Color.pink)
                            .cornerRadius(20)
                        
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
