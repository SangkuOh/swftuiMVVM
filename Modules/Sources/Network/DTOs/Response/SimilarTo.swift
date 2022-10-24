//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/24.
//
import Common

public struct SimilarToResponse: Codable, Hashable {
  public let word: String
  public let similarTo: [String]

  public init(
    word: String = "",
    similarTo: [String] = []
  ) {
    self.word = word
    self.similarTo = similarTo
  }
}

public extension SimilarToResponse {
  func toDomain() -> SimilarToEntity {
    .init(
      word: self.word,
      similarTo: self.similarTo
    )
  }
}
