//
//  APIRequestable.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//


import Foundation
import Alamofire

protocol DirectApiRequestable: DirectApiEndpoint, URLRequestConvertible {
    
}

extension DirectApiRequestable {
    
    func asURLRequest() throws -> URLRequest {
        guard let urlString =  baseURL else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        var encodedFinalURl = urlString
        
        var resourceURL = try encodedFinalURl.asURL()
        if let pathComponent =  path {
            guard let resourceString = resourceURL.appendingPathComponent(pathComponent).description.removingPercentEncoding else {
                throw AFError.parameterEncodingFailed(reason: .missingURL)
            }
            resourceURL = try resourceString.asURL()
        }
        let urlRequest = try URLRequest(url: resourceURL, method: method!, headers:  HTTPHeaders(headers ?? [:]))
        Logger.log(logLevel: .debug, "Direct API Url = " + encodedFinalURl)
        Logger.log(logLevel: .debug, "Resource Url = " + resourceURL.absoluteString)
        Logger.log(logLevel: .debug, "API request Header = " + (headers?.debugDescription ?? "[:]"))
        Logger.log(logLevel: .debug, "Method \(method.debugDescription)")
        Logger.log(logLevel: .debug, urlRequest.allHTTPHeaderFields.debugDescription)
        Logger.log(logLevel: .debug, parameters.debugDescription)
        return try encoding!.encode(urlRequest, with: parameters)
    }
    
    /**
     Header params to be passed for Get or Post request of type "application/x-www-form-urlencoded"
     
     - returns: HeaderParams
     */
    func headersForFormUrlEncodedRequest() -> HeaderParams {
        return [HeaderConstants.contentType: HeaderConstants.contentType]
    }

}
