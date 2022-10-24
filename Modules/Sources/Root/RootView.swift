//
//  SwiftUIView.swift
//  
//
//  Created by  오상구 on 2022/10/21.
//
import Main
import User
import Navigation
import Network
import SwiftUI

public struct RootView: View {
  @StateObject var navigationVM: NavigationVM
  @StateObject var rootVM: ViewModel
  
  public init(
    navigationVM: NavigationVM = .init(),
    rootVM: ViewModel = .init()
  ) {
    _navigationVM = StateObject(wrappedValue: navigationVM)
    _rootVM = StateObject(wrappedValue: rootVM)
  }
  
  public var body: some View {
    TabView(selection: $navigationVM.tap) {
      MainView()
        .tag(Tap.main)
        .tabItem {
          Text("Main")
        }
        .environmentObject(navigationVM)
      UserView()
        .tag(Tap.user)
        .tabItem {
          Text("User")
        }
        .environmentObject(navigationVM)
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView
      .init(rootVM: .init(wordService: WordServiceMock()))
  }
}
  
