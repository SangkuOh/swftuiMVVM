//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/24.
//

import Common

public protocol WordRepository {
  func getSimilarTo(word: String) async -> Result<SimilarToEntity, RequestError>
}

public struct WordRepositoryLive: HTTPClient, WordRepository {
  public static let shared: WordRepository = WordRepositoryLive()
  
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

public struct WordRepositoryMock: WordRepository {
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
  
