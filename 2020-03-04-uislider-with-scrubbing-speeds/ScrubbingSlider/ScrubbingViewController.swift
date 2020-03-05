import UIKit

class ScrubbingViewController: UIViewController {

    @IBOutlet private var slider: ScrubbingSlider!
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var speedLabel: UILabel!
    @IBOutlet private var offsetLabel: UILabel!

    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    @IBAction private func didScrub() {
        updateViews()
    }

    private func configureViews() {
        [valueLabel, speedLabel, offsetLabel].forEach {
            $0.font = .monospacedDigitSystemFont(ofSize: 24, weight: .semibold)
        }

        updateViews()
    }

    private func updateViews() {
        valueLabel.text = formatter.string(from: slider.value as NSNumber)
        speedLabel.text = formatter.string(from: slider.currentScrubbingSpeed.speed as NSNumber)
        offsetLabel.text = formatter.string(from: slider.currentScrubbingSpeed.verticalDistance as NSNumber)
    }
}
