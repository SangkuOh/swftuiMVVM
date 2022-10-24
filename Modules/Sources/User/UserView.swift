//
//  SwiftUIView.swift
//  
//
//  Created by  오상구 on 2022/10/21.
//

import SwiftUI
import Navigation

public struct UserView: View {
  @EnvironmentObject var navigationVM: NavigationVM
  @StateObject var viewModel: ViewModel = .init()
  @State var isLoading: Bool
  @State var isAlert: Bool
  
  public init(
    isLoading: Bool = false,
    isAlert: Bool = false
  ) {
    self.isLoading = isLoading
    self.isAlert = isAlert
  }
  
  public var body: some View {
    NavigationView {
        NavigationLink
        .init(
          isActive: $navigationVM.isUserDetail,
          destination: {
            Button {
              navigationVM.tappedUserDetailButton()
            } label: {
              Text("유저 디테일 입니다.")
            }
          },
          label: {
            Text("유저 디테일로 이동합니다.")
          }
        )
        .buttonStyle(.bordered)
        .navigationTitle("User")
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
