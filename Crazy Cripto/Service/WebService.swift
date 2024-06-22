//
//  WebService.swift
//  Crazy Cripto
//
//  Created by Ahmet Burak Öztürk on 22.06.2024.
//

import Foundation

enum CyrptoError: Error{
    case serverError
    case parsingError
}


class WebService {
    static let shared = WebService()
    
    func downloadCurrencies(completion: @escaping (Result<[CyrptoModel], CyrptoError>) -> ()) {
        let url = URL(string: ServiceConstants.baseUrl)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.serverError))
                
            } else if let data = data {
                let cyrptos = try? JSONDecoder().decode([CyrptoModel].self, from: data)

                if let result = cyrptos {
                    completion(.success(result))
                } else {
                    completion(.failure(.parsingError))
                }
            }
        }.resume()
    }
}
