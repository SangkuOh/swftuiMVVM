//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/21.
//

import SwiftUI

public class NavigationViewModel: ObservableObject {
  @Published public var tap: Tap
  @Published public var isMainDetail: Bool
  @Published public var isUserDetail: Bool
  
  public init(
    tap: Tap = .main,
    isMainDetail: Bool = false,
    isUserDetail: Bool = false
  ) {
    self.tap = tap
    self.isMainDetail = isMainDetail
    self.isUserDetail = isUserDetail
  }
}

// MARK: Clear All NavigationStack
public extension NavigationViewModel {
  func clearStacks() {
    isMainDetail = false
    isUserDetail = false
  }
}

public extension NavigationViewModel {
  func tappedMainDetailButton() {
    clearStacks()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.tap = .user
      self.isUserDetail = true
    }
  }
  
  func tappedUserDetailButton() {
    clearStacks()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.tap = .main
      self.isMainDetail = true
    }
  }
}

public enum Tap {
  case user
  case main
}
