import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: LaunchOptions?
  ) -> Bool {
    let window = UIWindow()
    window.rootViewController = ViewController()
    window.makeKeyAndVisible()

    self.window = window

    return true
  }
}
