//
//  MenuView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 26/08/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("ColorWelcomeYellow"), Color("ColorGreen")]), startPoint: .top, endPoint: .bottom)              .edgesIgnoringSafeArea(.all)
                VStack{
                    //navigate to easy mode
                    NavigationLink(destination: GameView()) {
                        Capsule()
                            .fill(Color("ColorPink"))
                            .padding(8)
                            .frame( width: 380, height:80)
                            .overlay(Text("Play Game")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white))
                    }
                    //navigate to hard mode
                    NavigationLink(destination: HardGameView()) {
                        Capsule()
                            .fill(Color("ColorPink"))
                            .padding(8)
                            .frame( width: 380, height:80)
                            .overlay(Text("Play Hard Mode")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white))
                    }
                    
                    //navigate to leaderboard
                    Button(action: {
                        
                    }, label: {
                        Capsule()
                            .fill(Color("ColorPink"))
                            .padding(8)
                            .frame( width: 380, height:80)
                            .overlay(Text("Leaderboard")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white))
                    })
                    
                    //navigate to guide view
                    NavigationLink(destination: GuideView()) {
                        Capsule()
                            .fill(Color("ColorPink"))
                            .padding(8)
                            .frame( width: 380, height:80)
                            .overlay(Text("How to Play")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white))
                    }
                    
                }
            }
        }
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
