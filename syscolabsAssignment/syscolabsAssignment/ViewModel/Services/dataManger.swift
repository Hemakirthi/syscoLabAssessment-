//
//  DataManger.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-05.
// data manager class to fetch all relevt data for this project

import Foundation
import Combine

class dataManager{
    
    @Published var allPlanets: [Result] = []
    @Published var pageHeader: PlanetModel?
    @Published var pageURLdata: String?
    
    var planetSubscription: AnyCancellable?
    
    init(){
        getAllPlanets()
    }
    
    func getAllPlanets(){
        guard let url = URL(string:pageURLdata ?? "https://swapi.dev/api/planets/") else {return}
        planetSubscription = networkManager.download(url: url)
            .decode(type: PlanetModel.self, decoder: JSONDecoder())
        //.map{$0.next}
        
        //.map{$0.results}
            .sink(receiveCompletion: networkManager.handleCompletion, receiveValue: {[weak self] (returnPlanets) in
                self?.pageHeader = returnPlanets
                self?.planetSubscription?.cancel()
            })
        
        
        
        
    }
    
    //    func fetchPlanets() {
    //        guard let url = URL(string: "https://swapi.dev/api/planets/") else {return}
    //        URLSession.shared.dataTaskPublisher(for: url)
    //            .map{ $0.data }
    //            .decode(type: PlanetModel.self, decoder: JSONDecoder())
    //            .replaceError(with: PlanetModel(count: 0, next: "", previous: "", results: [])) //<-- Here
    //            .map { $0.results }  //<-- Here
    //            .receive(on: DispatchQueue.main)
    //            .assign(to: &$Result)
    //    }
    //
    
}


