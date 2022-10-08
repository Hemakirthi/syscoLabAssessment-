//
//  starWarsPlanets.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-05.
//

import SwiftUI

struct starWarsPlanets: View {
    
    @EnvironmentObject private var vm: planetViewModel
    
    @State var results:[Result] = []
    
    var body: some View {
        
        ZStack{
            
            Color.white
                .ignoresSafeArea()
            VStack{
                HStack{
                    if (vm.pages?.previous) != nil { // Navigation Button back
                        circleButton(iconName: "arrowtriangle.left.fill")
                            .onTapGesture {
                                vm.addPageURL(pageURL: vm.pages?.previous ?? " ")
                            }
                    }
                    Spacer()
                    Text("Star War Planet")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                    if (vm.pages?.next) != nil { // Navigation Button Forward to load next page Planets
                        circleButton(iconName: "arrowtriangle.right.fill")
                            .onTapGesture {
                                vm.addPageURL(pageURL: vm.pages?.next ?? " ")
                            }
                        
                    }
                }
                .padding(.horizontal)
                Spacer(minLength: 0)
                
                
                HStack{
                    
                    
                    List{
                        
                        ForEach(vm.pages?.results ?? [] ,id:\.self){ planets in
                            planetRowView(planet: planets ) // Row view for each and every planet
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                }
            }
        }
        
        
    }
}

struct starWarsPlanets_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            starWarsPlanets().environmentObject(dev.planetVM)
        }
        .navigationBarHidden(true)
    }
}



