//
//  GreetingView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 27/08/2022.
//

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    @State var username: String = ""
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("ColorYellow"))
                .edgesIgnoringSafeArea(.all)
            HStack {
                Image("welcome")
                    .resizable()
                    .frame(alignment: .center)
            }
            
            VStack(){
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                //field for entering user name
                TextField("Type your username", text: $viewModel.existUsername)
                    .background(Color("ColorWhite"))
                    .cornerRadius(5)
                    .padding(10)
                    .textFieldStyle(.roundedBorder)

                //Start
                Button(action: {
                    viewModel.checkExistUser()
                    if !viewModel.askContinue {
                        active = false
                    }
                    
                }, label: {
                    Capsule()
                        .fill(Color(uiColor: UIColor(red: 1.00, green: 0.34, blue: 0.34, alpha: 1.00)))
                      .padding(8)
                      .frame( width: 380, height:80)
                      .overlay(Text("Let's start 🎲")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                })
            }
            .blur(radius:  viewModel.askContinue ? 5 : 0 , opaque: false)
            if viewModel.askContinue {
                ZStack{
                    Color("ColorBlackTransparent")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        VStack{
                            Image("lose_money")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                            Text("Continure or New Game?")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            HStack{
                                Button{
                                    viewModel.askContinue = false
                                    viewModel.isContinue()
                                    active = false
                                } label: {
                                    Text("Continue" .uppercased())
                                        .foregroundColor(.white)
                                        .fontWeight(.heavy)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                }
                                .background(Capsule().fill(Color("ColorRed")))
                                Button{
                                    viewModel.askContinue = false
                                    viewModel.isNewGame()
                                    active = false
                                } label: {
                                    Text("New Game" .uppercased())
                                        .foregroundColor(.white)
                                        .fontWeight(.heavy)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                }
                                .background(Capsule().fill(Color("ColorRed")))
                            }
                            
                        }
                        Spacer()
                    }
                    
                        
                }
                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                .background(Color("ColorBlue"))
                .cornerRadius(20)
                
            }
        }
//        .onAppear(perform: {playSound(sound: "welcome", type: "mp3")})
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true))
    }
}
