import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var ratingImageViews: [UIImageView]!

    var item: FavoriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        guard let item = item else { return }

        title = item.title
        itemImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        descriptionLabel.text = item.description

        let clampedRating = max(0, min(5, item.rating))
        let sortedStars = ratingImageViews.sorted { $0.frame.minX < $1.frame.minX }

        for (index, starView) in sortedStars.enumerated() {
            let symbolName = index < clampedRating ? "star.fill" : "star"
            starView.image = UIImage(systemName: symbolName)
        }
    }
}
