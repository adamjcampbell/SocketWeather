import UIKit

final class AppCoordinator {
  private let window = UIWindow()

  init() {}

  func start() {
    window.rootViewController = ViewController()
    window.makeKeyAndVisible()
  }
}
