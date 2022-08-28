//
//  WelcomeView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 27/08/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
    var body: some View {
        ZStack {
            // user hasnt click button in welcome view
            if isWelcomeActive {
                GreetingView(active: $isWelcomeActive)
            } else {
                // navigate to menu view after clicking button in welcome view
                MenuView()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


