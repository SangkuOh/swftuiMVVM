//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/24.
//

import Foundation

enum WordEndpoint {
  case words(String)
}

extension WordEndpoint: Endpoint {
  var path: String {
    switch self {
    case .words(let word):
      return "/words/\(word)/similarTo"
    }
  }

  var method: RequestMethod {
    switch self {
    case .words:
      return .get
    }
  }

  var header: [String: String]? {
    // MARK: enter your key
    let key = "e96baced85mshe28be68776f9861p184a48jsn3af9ea0c2f9d"
    let host = "wordsapiv1.p.rapidapi.com"
    switch self {
    case .words:
      return [
        "X-RapidAPI-Key": key,
        "X-RapidAPI-Host": host
      ]
    }
  }

  var body: [String: String]? {
    switch self {
    case .words:
      return nil
    }
  }
}
