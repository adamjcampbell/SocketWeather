import UIKit
import TinyConstraints

final class ChooseLocationViewController: UIViewController {
  enum Event {
    case choseLocation(geoHash: GeoHash)
  }

  var eventHandler: ((Event) -> Void)?

  private var chooseLocationView: ChooseLocationView { view as! ChooseLocationView }

  override func loadView() {
    view = ChooseLocationView()
  }

  override func viewDidLoad() {
    chooseLocationView.collingwoodTapHandler = { [unowned self] in
      self.eventHandler?(.choseLocation(geoHash: "r1r0gjr"))
    }
  }

  private final class ChooseLocationView: UIView {
    var collingwoodTapHandler: (() -> Void)?

    override init(frame: CGRect) {
      super.init(frame: frame)

      backgroundColor = UIColor(named: "background")

      let topSpace = UIView()

      let titleLabel = UILabel()
      titleLabel.numberOfLines = 0
      titleLabel.text = "Where's your weather?"
      titleLabel.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: traitCollection)

      let collingwoodButton = UIButton()
      collingwoodButton.setTitle("COLLINGWOOD", for: .normal)
      collingwoodButton.setTitleColor(.label, for: .normal)
      collingwoodButton.addTarget(self, action: #selector(didTapCollingwood), for: .touchUpInside)
      collingwoodButton.layer.cornerRadius = 4
      collingwoodButton.layer.borderColor = UIColor.secondaryLabel.cgColor
      collingwoodButton.layer.borderWidth = 1

      let bottomSpace = UIView()

      [topSpace, titleLabel, collingwoodButton, bottomSpace].forEach(addSubview)

      topSpace.edgesToSuperview(excluding: .bottom)
      topSpace.height(to: bottomSpace, multiplier: 0.33)
      titleLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(32))
      titleLabel.top(to: topSpace, topSpace.bottomAnchor)
      titleLabel.bottom(to: collingwoodButton, collingwoodButton.topAnchor, offset: -8)
      collingwoodButton.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(32))
      collingwoodButton.bottom(to: bottomSpace, bottomSpace.topAnchor)
      bottomSpace.edgesToSuperview(excluding: .top)
    }

    @objc private func didTapCollingwood() {
      collingwoodTapHandler?()
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }
}
