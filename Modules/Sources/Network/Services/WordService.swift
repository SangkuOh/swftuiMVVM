//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/24.
//

import Common

public protocol WordService {
  func getSimilarTo(word: String) async -> Result<SimilarToEntity, RequestError>
}

public struct WordServiceLive: HTTPClient, WordService {
  public static let shared: WordService = WordServiceLive()
  
  public func getSimilarTo(word: String) async -> Result<SimilarToEntity, RequestError> {
    let response = await sendRequest(
      endpoint: WordEndpoint.words(word),
      responseModel: SimilarToResponse.self
    )
    
    switch response {
    case .success(let success):
      return .success(success.toDomain())
      
    case .failure(let failure):
      return .failure(failure)
    }
  }
}

public struct WordServiceMock: WordService {
  let similarToEntityResult: Result<SimilarToEntity, RequestError>
  
  public init(
    similarToEntityResult: Result<SimilarToEntity, RequestError> = .failure(.noResponse)
  ) {
    self.similarToEntityResult = similarToEntityResult
  }

  public func getSimilarTo(word: String) async -> Result<SimilarToEntity, RequestError> {
    similarToEntityResult
  }
}
  
