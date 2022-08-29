//
//  HardGameView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 28/08/2022.
//

import SwiftUI

struct HardGameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack{
            //background
            LinearGradient(gradient: Gradient(colors: [Color("ColorWelcomeYellow"), Color("ColorGreen")]), startPoint: .top, endPoint: .bottom)              .edgesIgnoringSafeArea(.all)

            VStack{
                //title
                HStack{
                    HardTitleView()
                }.scaleEffect(2)
                
                Spacer()
                
                HStack{
                    //Credits counter
                    Text("Credits: ".uppercased() + String(viewModel.currentCredits) )
                        .modifier(scoreStyle())
                    
                    Spacer()
                    
                    //High score counter
                    Text("High Score: ".uppercased() + String(viewModel.highscore) )
                        .modifier(scoreStyle())
                }.padding()
                
                Spacer()
                
                //Cards
                HStack{
                    Spacer()
                    
                    Image(viewModel.dices[viewModel.numbers[0]])
                        .resizable()
                        .modifier(diceImageModifier())
                        .aspectRatio(1, contentMode: .fit)
                    
                    Image(viewModel.dices[viewModel.numbers[1]])
                        .resizable()
                        .modifier(diceImageModifier())
                        .aspectRatio(1, contentMode: .fit)
                    Image(viewModel.dices[viewModel.numbers[2]])
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
                        viewModel.playButton()
                        
                        //check winning
                        viewModel.checkHardWinning()
                        
                        //Game over
                        viewModel.isEndGame()

                    })
                    {
                     Text("Spin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing],30)
                            .background(Color("ColorPink"))
                            .cornerRadius(20)
                            .modifier(ShadowModifier())
                    }
                    
                }
                
                Spacer()
                
                HStack{
                    //player bet 20 coins
                    Button {
                        viewModel.bet20()
                        playSound(sound: "bet-coin", type: "wav")
                    } label: {
                        HStack{
                            Text("20")
                                .modifier(BetCapsuleModifier())
                            Image("chips")
                                .resizable()
                                .opacity(viewModel.isChooseBet20 ? 1 : 0)
                                .modifier(ChipModifier())
                        }
                    }
                    
                    Spacer()
                    
                    //player bet 10 coins
                    Button {
                        viewModel.bet10()
                        playSound(sound: "bet-coin", type: "wav")
                    } label: {
                        HStack{
                            Image("chips")
                                .resizable()
                                .opacity(viewModel.isChooseBet10 ? 1 : 0)
                                .modifier(ChipModifier())
                            Text("10")
                                .modifier(BetCapsuleModifier())
                        }
                    }
                }
            }
            .padding()
            .blur(radius:  viewModel.showEndGameModel ? 5 : 0 , opaque: false)
            if viewModel.showEndGameModel {
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
                            .background(Color("ColorRed"))
                        Spacer()
                        VStack{
                            Image("lose_money")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                            Text("You lost all your money!!! \n \n Let's try again")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Button{
                                viewModel.showEndGameModel = false
                                viewModel.isNewGame()
                                playSound(sound: "new-game", type: "wav")
                            } label: {
                                Text("New Game" .uppercased())
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                            }
                            .background(Capsule().fill(Color("ColorRed")))
                            
                        }
                        Spacer()
                    }
                        
                }
                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                .background(Color("ColorBlue"))
                .cornerRadius(20)
                
            }
        }
        .onAppear(perform: {playSound(sound: "new-game", type: "wav")})
    }
}

struct HardGameView_Previews: PreviewProvider {
    static var previews: some View {
        HardGameView()
    }
}
