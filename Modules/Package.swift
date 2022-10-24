// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
  name: "Modules",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .root,
    .navigation,
    .network,
    .common,
    .main,
    .user
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    .main,
    .user,
    .common,
    .network,
    .navigation,
    .root
  ]
)

// MARK: Product
extension Product {
  static let main = library(name: .main, targets: [.main])
  static let user = library(name: .user, targets: [.user])
  static let network = library(name: .network, targets: [.network])
  static let navigation = library(name: .navigation, targets: [.navigation])
  static let common = library(name: .common, targets: [.common])
  static let root = library(name: .root, targets: [.root])
}

// MARK: Target
extension Target {
  static let main = target(name: .main, dependencies: [.navigation])
  static let user = target(name: .user, dependencies: [.navigation])
  static let navigation = target(name: .navigation, dependencies: [.common])
  static let network = target(name: .network, dependencies: [.common])
  static let common = target(name: .common)
  static let root = target(
    name: .root,
    dependencies: [
      .navigation,
      .common,
      .network,
      .main,
      .user
    ]
  )
}

extension Target.Dependency {
  static let root = byName(name: .root)
  static let network = byName(name: .network)
  static let common = byName(name: .common)
  static let navigation = byName(name: .navigation)
  static let main = byName(name: .main)
  static let user = byName(name: .user)
}

// MARK: Module String
fileprivate extension String {
  static let root = "Root"
  static let navigation = "Navigation"
  static let network = "Network"
  static let common = "Common"
  static let main = "Main"
  static let user = "User"
}
