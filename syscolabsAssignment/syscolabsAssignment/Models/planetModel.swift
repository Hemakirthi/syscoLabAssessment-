//
//  planetModel.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-05.
// Planet data Model 

import Foundation

//struct Result: Codable,Hashable {
//    let  results: [planetModel]
//}
//
//struct planetModel:Codable,Hashable {
//
//    let name:String
//    let climate:String
//    let orbitalPeriod:String
//    let gravity:String
//
//    enum CodingKeys: String, CodingKey {
//        //case id
//        case name,climate,gravity
//        case orbitalPeriod = "orbital_period"
//    }
//
//}
//struct PlanetModel: Codable,Hashable {
//    let name: String
//    let rotationPeriod, orbitalPeriod, diameter: String?
//    let climate: String
//    let gravity, terrain, surfaceWater: String?
//    let population: String?
//    let residents, films: [String]?
//    let created, edited: String?
//    let url: String?
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case rotationPeriod = "rotation_period"
//        case orbitalPeriod = "orbital_period"
//        case diameter, climate, gravity, terrain
//        case surfaceWater = "surface_water"
//        case population, residents, films, created, edited, url
//    }
//}
// MARK: - PlanetModel


// MARK: - Result
struct Result: Codable,Hashable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
            case name
            case rotationPeriod = "rotation_period"
            case orbitalPeriod = "orbital_period"
            case diameter, climate, gravity, terrain
            case surfaceWater = "surface_water"
            case population, residents, films, created, edited, url
        }
}
struct PlanetModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Result]
}


