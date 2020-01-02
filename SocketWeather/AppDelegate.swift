import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

  private let appCoordinator = AppCoordinator()

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: LaunchOptions?
  ) -> Bool {
    appCoordinator.start()
    return true
  }
}
