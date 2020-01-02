import UIKit
import TinyConstraints

final class ChooseLocationViewController: UIViewController {
  override func loadView() {
    view = ChooseLocationView()
  }

  private final class ChooseLocationView: UIView {
    override init(frame: CGRect) {
      super.init(frame: frame)

      backgroundColor = UIColor(named: "background")

      let topSpace = UIView()

      let titleLabel = UILabel()
      titleLabel.text = "Where's your weather?"
      titleLabel.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: traitCollection)

      let bottomSpace = UIView()

      [topSpace, titleLabel, bottomSpace].forEach(addSubview)

      topSpace.edgesToSuperview(excluding: .bottom)
      topSpace.height(to: bottomSpace, multiplier: 0.33)
      titleLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(32))
      titleLabel.top(to: topSpace, topSpace.bottomAnchor)
      titleLabel.bottom(to: bottomSpace, bottomSpace.topAnchor)
      bottomSpace.edgesToSuperview(excluding: .top)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }
}
