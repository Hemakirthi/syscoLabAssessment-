//
//  networkManager.swift
//  syscolabsAssignment
//
//  Created by D H Jayasinghe on 2022-10-05.
// genaric class for this project but didnt use geric types here

import Foundation
import Combine

class networkManager{
    
    enum networkError: LocalizedError{
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self{
            case .badURLResponse(url: let url): return "Bad Response From URL:\(url)"
            case .unknown : return "Unknown error occured"
            }
        }
        
    }
    
    static  func download(url:URL) -> AnyPublisher<Data,Error>{
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on:DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output,url:URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,response.statusCode >= 200 && response.statusCode < 300 else {
            throw networkError.badURLResponse(url: url)
        }
        //print(output.data)
        return output.data
        
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("error.localizedDescription")
            print(error.localizedDescription)
        }
    }
    
    static func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, Error> {
        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .customISO8601
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                print(error.localizedDescription) as! Error
                // ServiceError.parsingError(error: error)
            }
            .eraseToAnyPublisher()
    }
    
}
