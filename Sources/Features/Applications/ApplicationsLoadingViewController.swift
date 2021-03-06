import Cocoa
import UserInterface

class ApplicationsLoadingViewController: NSViewController {
  override func loadView() { view = baseView }
  lazy var baseView = NSView()
  lazy var textField = NSTextField()
  lazy var progress = NSProgressIndicator()

  private var layoutConstraints = [NSLayoutConstraint]()

  init(text: String) {
    super.init(nibName: nil, bundle: nil)
    self.textField.stringValue = text
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let stackView = NSStackView()
    stackView.orientation = .vertical
    stackView.alignment = .centerX
    stackView.distribution = .gravityAreas
    stackView.addArrangedSubview(textField)
    stackView.addArrangedSubview(progress)
    NSLayoutConstraint.addAndPin(stackView, toView: view, insets: .init(top: 20, left: 20, bottom: 20, right: 20))
    NSLayoutConstraint.deactivate(layoutConstraints)

    textField.maximumNumberOfLines = -1
    textField.alignment = .center
    textField.isBezeled = false
    textField.isBordered = false
    textField.isEditable = false
    textField.isSelectable = false
    textField.drawsBackground = false
    textField.font = NSFont.systemFont(ofSize: 15)
    progress.canDrawConcurrently = true
    progress.isIndeterminate = false
    progress.style = .bar
    progress.doubleValue = 0.0
  }

  func setText(_ text: String) {
    self.textField.stringValue = text
  }
}
