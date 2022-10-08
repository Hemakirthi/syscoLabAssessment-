//
//  previewExtention.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-06.
// this is  create onfor inline( development type testing before netwark class implemented

import Foundation
import SwiftUI

extension PreviewProvider{
    
    static var dev:DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    
    static let instance = DeveloperPreview()
    
    private init(){
        
    }
    let planetVM = planetViewModel()
    
    
    
    //let planet = PlanetModel(name: "Tatooine", rotationPeriod: "23", orbitalPeriod: "304", diameter: "10465", climate: "arid", gravity: "1 standard", terrain: "desert", surfaceWater: "1", population: "200000", residents: [""], films: [""], created: "", edited: "", url: "")
    //let res = Result(name: "Tatooine", rotationPeriod: "23", orbitalPeriod: "304", diameter: "10465", climate: "arid", gravity: "1 standard", terrain: "desert", surfaceWater: "1", population: "200000", residents: [""], films: [""], created: "", edited: "", url: "")
    
    let planet = PlanetModel(count: 60, next: "", previous: nil, results:[Result(name: "Tatooine", rotationPeriod: "23", orbitalPeriod: "304", diameter: "10465", climate: "arid", gravity: "1 standard", terrain: "desert", surfaceWater: "1", population: "200000", residents: [""], films: [""], created: "", edited: "", url: "")
                                                                         ])
}

//"name": "Tatooine",
//           "rotation_period": "23",
//           "orbital_period": "304",
//           "diameter": "10465",
//           "climate": "arid",
//           "gravity": "1 standard",
//           "terrain": "desert",
//           "surface_water": "1",
//           "population": "200000",
