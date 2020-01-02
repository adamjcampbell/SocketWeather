import UIKit

final class AppCoordinator {
  private let window = UIWindow()

  init() {}

  func start() {
    let chooseLocationViewController = ChooseLocationViewController()
    chooseLocationViewController.eventHandler = handleChooseLocationEvent
    window.rootViewController = chooseLocationViewController
    window.makeKeyAndVisible()
  }

  func handleChooseLocationEvent(_ event: ChooseLocationViewController.Event) {
    switch event {
    case .choseLocation(let geoHash):
      getObservations(geoHash: geoHash) { result in
        switch result {
        case .success(let observations):
          DispatchQueue.main.async {
            self.window.rootViewController = HomeViewController(currentObservations: observations)
          }
        }
      }
    }
  }
}
