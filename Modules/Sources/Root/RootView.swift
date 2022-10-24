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
  @StateObject var NavigationViewModel: NavigationViewModel
  @StateObject var viewModel: ViewModel
  
  public init(
    NavigationViewModel: NavigationViewModel = .init(),
    viewModel: ViewModel = .init()
  ) {
    _NavigationViewModel = StateObject(wrappedValue: NavigationViewModel)
    _viewModel = StateObject(wrappedValue: viewModel)
  }
  
  public var body: some View {
    TabView(selection: $NavigationViewModel.tap) {
      MainView()
        .tag(Tap.main)
        .tabItem {
          Text("Main")
        }
        .environmentObject(NavigationViewModel)
      UserView()
        .tag(Tap.user)
        .tabItem {
          Text("User")
        }
        .environmentObject(NavigationViewModel)
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView
      .init(
        viewModel: .init(
          WordRepository: WordRepositoryMock
            .init(similarToEntityResult: .success(.init()))
        )
      )
  }
}
