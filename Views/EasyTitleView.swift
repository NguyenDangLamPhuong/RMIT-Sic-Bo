//
//  TitleView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 24/08/2022.
//

import SwiftUI

struct EasyTitleView: View {
    var body: some View{
        Image(systemName: "star.fill").foregroundColor(.yellow)
        Text("Easy round")
            .bold()
            .font(.system(size: 20, design: .rounded))
            .foregroundColor(.white)
        Image(systemName: "star.fill").foregroundColor(.yellow)
    }
}
