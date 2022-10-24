//
//  File.swift
//
//
//  Created by  오상구 on 2022/10/21.
//

import Common
import Network
import SwiftUI

public extension RootView {
  class ViewModel: ObservableObject {
    @Published var isMain: Bool = false
    @Published var isMainDetail: Bool = false
    @Published var isUser: Bool = false
    @Published var isUserDetail: Bool = false
    
    let wordService: WordService
    
    public init(
      wordService: WordService = WordServiceLive.shared
    ) {
      self.wordService = wordService
    }
    
    // MARK: APIs
    @MainActor
    func getSimilarTo() async -> Result<SimilarToEntity, RequestError> {
      await wordService.getSimilarTo(word: "")
    }
  }
}
