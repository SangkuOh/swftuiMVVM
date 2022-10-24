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
  @StateObject var viewModel: ViewModel
  
  public init(
    navigationVM: NavigationVM = .init(),
    viewModel: ViewModel = .init()
  ) {
    _navigationVM = StateObject(wrappedValue: navigationVM)
    _viewModel = StateObject(wrappedValue: viewModel)
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
      .init(
        viewModel: .init(
          wordService: WordServiceMock
            .init(similarToEntityResult: .success(.init()))
        )
      )
  }
}
