//
//  planetDetails.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-07.
// this view use to display the selected planet details and this load as a sheet

import SwiftUI

struct planetDetails: View {
    @Environment(\.presentationMode) var presentationMode
    let planet:Result
    var body: some View {
        //ZStack{
        VStack{
            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.leading,0)
        }
        Spacer()
        VStack{
            HStack{
                Text(planet.name)
            }
            HStack{
                Text(planet.orbitalPeriod)
            }
            HStack{
                Text(planet.gravity ?? " ")
            }
        }
        Spacer()
        
        
        // }
    }
}




//struct planetDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        planetDetails()
//    }
//}
