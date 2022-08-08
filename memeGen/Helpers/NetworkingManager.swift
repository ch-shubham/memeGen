//
//  NetworkingManager.swift
//  memeGen
//
//  Created by user224812 on 8/8/22.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkingManager {
    static var shared: NetworkingManager = {
        let instance = NetworkingManager()
        return instance
    }()
    
    private init() {
        
    }
    
    func getData<T:Codable>(url: URL,objectType:T.Type,onCompletion: @escaping (Result<T>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let myData = try? JSONDecoder().decode(objectType.self, from: data!)
                onCompletion(Result.success(myData!))
            } catch {
                onCompletion(Result.failure(error))
            }
        }.resume()
    }
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    public static func downloadImage(url: URL,
                                     completion: @escaping (Result<Data>) -> Void) {
        NetworkingManager.getData(url: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async() {
                completion(.success(data))
            }
        }
    }
}
