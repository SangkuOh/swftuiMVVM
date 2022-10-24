//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/21.
//

import SwiftUI

public extension MainView {
  class ViewModel: ObservableObject {
    @Published var list: [String] = []
    
    public init() {
      
    }
  }
}
