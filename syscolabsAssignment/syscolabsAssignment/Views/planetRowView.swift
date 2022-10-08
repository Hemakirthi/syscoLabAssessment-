//
//  planetRowView.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-06.

// this is the basic design for row view for planet main view

import SwiftUI

struct planetRowView: View {
    let planet:Result
    @State private var isOpen2 = false
    var body: some View {
        HStack(spacing:0){
            Circle()
                .frame(width: 30, height: 30)
                .padding(.leading,4)
            Text(planet.name)
                .font(.headline)
                .padding(.leading,6)
                .foregroundColor(.accentColor)
                .frame(minWidth:30)
            
            
            Spacer()
            Text(planet.climate ?? " ")
                .font(.headline)
            
                .foregroundColor(.red )
            
        }
        .padding()
        .onTapGesture {
            self.isOpen2.toggle()
        }
        .sheet(isPresented: $isOpen2) {
            planetDetails(planet: planet)
        }
    }
}

struct planetRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            planetRowView(planet: dev.planet.results[0])
                .previewLayout(.sizeThatFits)
            planetRowView(planet: dev.planet.results[0])
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
        }
    }
}
