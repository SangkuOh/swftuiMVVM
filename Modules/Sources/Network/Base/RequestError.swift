//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/24.
//

import Foundation

public enum RequestError: Error {
  case decode
  case invalidURL
  case noResponse
  case unauthorized
  case unexpectedStatusCode
  case unknown

  var customMessage: String {
    switch self {
    case .decode:
      return "Decode error"
    case .unauthorized:
      return "Session expired"
    default:
      return "Unknown error"
    }
  }
}
