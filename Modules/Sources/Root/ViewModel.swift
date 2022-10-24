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
    
    let WordRepository: WordRepository
    
    public init(
      WordRepository: WordRepository = WordRepositoryLive.shared
    ) {
      self.WordRepository = WordRepository
    }
    
    // MARK: APIs
    @MainActor
    func getSimilarTo() async -> Result<SimilarToEntity, RequestError> {
      await WordRepository.getSimilarTo(word: "")
    }
  }
}
