//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/21.
//

import SwiftUI

public class NavigationVM: ObservableObject {
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
public extension NavigationVM {
  func clearStacks() {
    isMainDetail = false
    isUserDetail = false
  }
}

public extension NavigationVM {
  func tappedMainDetailButton() {
    clearStacks()
    tap = .user
    isUserDetail = true
  }
  
  func tappedUserDetailButton() {
    clearStacks()
    tap = .main
    isMainDetail = true
  }
}

public enum Tap {
    case user
    case main
  }
