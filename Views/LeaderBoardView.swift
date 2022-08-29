//
//  LeaderBoardView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 29/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    let user_list : [String: String] = UserDefaults.standard.object(forKey: "user") as? [String: String] ?? [:]
    var body: some View {
        ZStack{
            //background
            LinearGradient(gradient: Gradient(colors: [Color("ColorWelcomeYellow"), Color("ColorGreen")]), startPoint: .top, endPoint: .bottom)              .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Player Scores")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                ForEach(user_list.sorted(by: {$0.value < $1.value} ), id: \.key) {
                    key, value in
                    HStack{
                        Image("first1")
                            .resizable()
                            .frame(width: 50, height: 80)
                            .padding()
                        VStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white.opacity(0.5))
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                                .frame(width:270 ,height: 60, alignment: .top)
                                .overlay(
                                    HStack {
                                        Text(key)
                                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                                            .padding([.leading], 10)
                                        
                                        Spacer()
                                        Text(value)
                                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        .padding([.trailing], 10)
                                        
                                    }
                                )
                        }
                    }
                    
                }
                
                Spacer()
                
            }
        }
        
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
