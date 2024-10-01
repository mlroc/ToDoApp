//
//  HeaderView.swift
//  ToDoApp
//
//  Created by Michael Liu on 5/26/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "Title",
               subtitle: "subtitle",
               angle: 15,
               background: .blue)
}
