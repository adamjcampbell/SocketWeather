import UIKit

final class ChooseLocationViewController: UIViewController {
  override func loadView() {
    view = ChooseLocationView()
  }

  private final class ChooseLocationView: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .green
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }
}
