//
//  APIManager.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//

import Foundation
import Alamofire

class APIManager {
    // Generic request
    func request<T: Codable>(url: String,
                             method: HTTPMethod,
                             parameters: Parameters? = nil,
                             headers: HTTPHeaders? = nil,
                             completion: @escaping (Result<T, AFError>) -> Void) {
        
        // Log request info
        print("➡️ Request URL: \(url)")
        print("➡️ HTTP Method: \(method.rawValue)")
        if let params = parameters {
            print("➡️ Parameters: \(params)")
        } else {
            print("➡️ Parameters: nil")
        }
        if let headers = headers {
            print("➡️ Headers: \(headers)")
        } else {
            print("➡️ Headers: nil")
        }
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                   headers: headers)
        .validate()
        .responseDecodable(of: T.self) { response in
            
            // Log response info
            if let statusCode = response.response?.statusCode {
                print("⬅️ Status Code: \(statusCode)")
            }
            
            switch response.result {
            case .success(let value):
                print("✅ Response: \(value)")
                
                do {
                        let encoder = JSONEncoder()
                        encoder.outputFormatting = .prettyPrinted  // nice readable format
                        let data = try encoder.encode(value)
                        if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            print(jsonObject)
                        }
                    } catch {
                        print("Failed to convert object to dictionary: \(error)")
                    }
                
                completion(.success(value))
            case .failure(let error):
                if let data = response.data,
                   let jsonString = String(data: data, encoding: .utf8) {
                    print("❌ Response Data: \(jsonString)")
                }
                print("❌ Error: \(error)")
                completion(.failure(error))
            }
        }
    }

}

