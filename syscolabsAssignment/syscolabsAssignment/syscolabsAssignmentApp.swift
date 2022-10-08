//
//  syscolabsAssignmentApp.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-05.
//

import SwiftUI

@main
struct syscolabsAssignmentApp: App {
    @StateObject private var vm = planetViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
            starWarsPlanets().environmentObject(vm)
                    .navigationBarHidden(true)
            }
        }
    }
}
