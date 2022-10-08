//
//  circleButton.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-07.
// thses are forward and back button designing view time was not eough to complete the Dark and light mode completely

import SwiftUI

struct circleButton: View {
    let iconName:String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.black)
            .frame(width: 50, height: 50)
            .background(Circle()
                .foregroundColor(.white)
            )
            .shadow(color: .accentColor.opacity(0.25), radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct circleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            circleButton(iconName: "arrowtriangle.left.fill")
                .previewLayout(.sizeThatFits)
            
            circleButton(iconName: "arrowtriangle.right.fill")
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
        }
    }
}
