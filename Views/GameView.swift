//
//  GameView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 27/08/2022.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    //RESTE GAME LOGIC
    var body: some View {
        ZStack{
            //background
//            Rectangle().foregroundColor(Color("ColorDarkYellow"))
//                .edgesIgnoringSafeArea(.all)
//            Rectangle().foregroundColor(Color("ColorYellow"))
//                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all
//                )
            LinearGradient(gradient: Gradient(colors: [Color("ColorWelcomeYellow"), Color("ColorGreen")]), startPoint: .top, endPoint: .bottom)              .edgesIgnoringSafeArea(.all)

            VStack{
                //title
                HStack{
                    EasyTitleView()
                }.scaleEffect(2)
                
                Spacer()
                
                HStack{
                    //Credits counter
                    Text("Credits: ".uppercased() + String(viewModel.credits) )
                        .modifier(scoreStyle())
                    
                    Spacer()
                    
                    //Credits counter
                    Text("High Score: ".uppercased() + String(viewModel.score) )
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
//                        .animation(<#T##animation: Animation?##Animation?#>, value: <#T##Equatable#>)
                    
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
                        viewModel.checkSmallWinning()
                        
                        //Game over
                        viewModel.isEndGame()

                    })
                    {
                     Text("Small")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing],30)
                            .background(Color("ColorPink"))
                            .cornerRadius(20)
                            .modifier(ShadowModifier())
                        
                    }
                    Button(action: {
                        //click small button to bet small
                        viewModel.playButton()
                        
                        //check winning
                        viewModel.checkBigWinning()
                        
                        //Game over
                        viewModel.isEndGame()
                    })
                    {
                     Text("Big")
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
                    
                    Button {
                        viewModel.bet20()
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
                    
                    Button {
                        viewModel.bet10()
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
                                viewModel.showEndGameModel = false
                                viewModel.credits = 100
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
