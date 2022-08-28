//
//  GuideView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 27/08/2022.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
              Form {
                Section(header: Text("How To Play")) {
                    Text("Play the game with Easy/Hard Mode")
                    Text("You will bet 10 or  20 (default is 10)")
                    Text("Pick \"Small\" or \"Big\"")
                    Text("Player wins with \"Small\" if combination is  from 4 to 10, with \"Big\" if combination is  from 3 or 18 ")
                    Text("There are special cases:  if all three dice land on the same number, everybody loses")
                }
                  Section(header: Text("Hard Mode")) {
                          Text("Play wins if all three dice land on the same number")
                          Text("Player get x2 coins which player bet")
                      
                  }
                  Section(header: Text("Application Information")) {
                      HStack {
                        Text("App Name")
                        Spacer()
                        Text("Tai Sai")
                      }
                      HStack {
                        Text("Course")
                        Spacer()
                        Text("COSC2659")
                      }
                      HStack {
                        Text("Year Published")
                        Spacer()
                        Text("2022")
                      }
                      HStack {
                        Text("Location")
                        Spacer()
                        Text("Saigon South Campus")
                      }
                }
              }
              .font(.system(.body, design: .rounded))
          
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
