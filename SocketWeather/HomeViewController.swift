import UIKit

final class HomeViewController: UIViewController {
  private let currentObservations: CurrentObservations
  private var homeView: HomeView { view as! HomeView }

  init(currentObservations: CurrentObservations) {
    self.currentObservations = currentObservations

    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    self.view = HomeView()
  }

  override func viewDidLoad() {
    homeView.tempLabel.text = String(currentObservations.temp)
  }

  private final class HomeView: UIView {
    let tempLabel: UILabel

    override init(frame: CGRect) {
      tempLabel = UILabel()

      super.init(frame: frame)

      backgroundColor = UIColor(named: "background")
      addSubview(tempLabel)
      tempLabel.edgesToSuperview(excluding: .bottom, insets: .horizontal(32), usingSafeArea: true)
      tempLabel.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: traitCollection)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
