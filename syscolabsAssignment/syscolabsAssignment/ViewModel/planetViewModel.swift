//
//  planetViewModel.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-05.
// ViewModel whic communicate with all the stakehodler sruck/view and class

import Foundation
import Combine

//https://swapi.dev/api/planets/

class planetViewModel:ObservableObject{
    
    @Published  var planets:[Result] = []
    @Published  var pages:PlanetModel?
    @Published  var pageurl:String = ""
    
    
    
    private let datamanager = dataManager()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        
        addSubscribers()
        
    }
    
    func addSubscribers(){
        datamanager.$pageHeader
            .sink { [weak self](returnPlanet) in
                self?.pages = returnPlanet
            }
            .store(in: &cancellables)
    }
    func addPageURL(pageURL:String)
    {
        datamanager.pageURLdata = pageURL
        if pageURL != " " {
            datamanager.pageURLdata = pageURL
            datamanager.getAllPlanets()
            addSubscribers()
            
            
        }
        
        
    }
    
    
}
