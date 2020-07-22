//
//  WebService.swift
//  HotCoffeeMVVM
//
//  Created by mohamed  habib on 22/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

enum NetworkError : Error {
    case decodingError
    case demainError
    case urlError
}

struct Resource<T: Codable> {
    let url :URL
}


class WebService {
    
    func load<T>(resource: Resource<T>, Completion: @escaping (Result<T,NetworkError>) -> (Void)) {
        
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                         Completion(.failure(.demainError))
                         return
                     }
                     
                     let result = try? JSONDecoder().decode(T.self, from: data)
                     
                     if let result = result {
                         DispatchQueue.main.async {
                             Completion(.success(result))
                         }
                     }else{
                         Completion(.failure(.decodingError))
                     }
            
        }.resume()
    }
}
