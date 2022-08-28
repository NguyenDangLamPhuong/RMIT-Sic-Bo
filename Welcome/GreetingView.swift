//
//  GreetingView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 27/08/2022.
//

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("ColorYellow"))
                .edgesIgnoringSafeArea(.all)
            HStack {
                Image("welcome")
                    .resizable()
                    .frame(alignment: .center)
            }
            
            VStack(spacing: 100){
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Button(action: {
                    active = false
                }, label: {
                    Capsule()
                        .fill(Color(uiColor: UIColor(red: 1.00, green: 0.34, blue: 0.34, alpha: 1.00)))
                      .padding(8)
                      .frame( width: 380, height:80)
                      .overlay(Text("Let's start 🎲")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                      //.opacity(<#T##opacity: Double##Double#>)
                })
                
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true))
    }
}
