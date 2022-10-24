//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/24.
//

import Foundation

protocol HTTPClient {
  func sendRequest<T: Decodable>(
    endpoint: Endpoint,
    responseModel: T.Type
  ) async -> Result<T, RequestError>
}

extension HTTPClient {
  func sendRequest<T: Decodable>(
    endpoint: Endpoint,
    responseModel: T.Type
  ) async -> Result<T, RequestError> {
    var urlComponents = URLComponents()
    urlComponents.scheme = endpoint.scheme
    urlComponents.host = endpoint.host
    urlComponents.path = endpoint.path
    
    guard let url = urlComponents.url else {
      return .failure(.invalidURL)
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue
    request.allHTTPHeaderFields = endpoint.header
    
    if let body = endpoint.body {
      request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    }
    
    NetworkLogger.log(request: request)
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
      NetworkLogger.log(response: response as? HTTPURLResponse, data: data)
      guard let response = response as? HTTPURLResponse else {
        return .failure(.noResponse)
      }
      switch response.statusCode {
      case 200...299:
        guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
          return .failure(.decode)
        }
        return .success(decodedResponse)
        
      case 401:
        return .failure(.unauthorized)
        
      default:
        return .failure(.unexpectedStatusCode)
      }
    } catch {
      print(error)
      return .failure(.unknown)
    }
  }
}

