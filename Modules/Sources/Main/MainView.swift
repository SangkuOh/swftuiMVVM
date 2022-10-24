//
//  SwiftUIView.swift
//  
//
//  Created by  오상구 on 2022/10/21.
//

import SwiftUI
import Navigation

public struct MainView: View {
  @EnvironmentObject var navigationVM: NavigationVM
  @StateObject var viewModel: ViewModel
  @State var isLoading: Bool
  @State var isAlert: Bool
  
  public init(
    viewModel: ViewModel = .init(),
    isLoading: Bool = false,
    isAlert: Bool = false
  ) {
    _viewModel = StateObject(wrappedValue: viewModel)
    self.isLoading = isLoading
    self.isAlert = isAlert
  }
  
    public var body: some View {
      NavigationView {
        NavigationLink
          .init(
            isActive: $navigationVM.isMainDetail,
            destination: {
              Button {
                navigationVM.tappedMainDetailButton()
              } label: {
                Text("디테일 페이지입니다.")
              }
              .buttonStyle(.bordered)
            },
            label: {
              Text("디테일 페이지로 이동합니다.")
            }
          )
          .buttonStyle(.bordered)
          .navigationTitle("Main")
          .background()
      }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      MainView()
    }
}
