//
//  HardTitleView.swift
//  RMIT Sic Bo
//
//  Created by Mac on 28/08/2022.
//

import SwiftUI

struct HardTitleView: View {
    var body: some View{
        Image(systemName: "star.fill").foregroundColor(.yellow)
        Text("Hard round")
            .bold()
            .font(.system(size: 20, design: .rounded))
            .foregroundColor(.white)
        Image(systemName: "star.fill").foregroundColor(.yellow)
    }
}
