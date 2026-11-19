import UIKit

final class FavoriteCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet var ratingImageViews: [UIImageView]!

    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        itemImageView.image = UIImage(named: item.imageName)

        let clampedRating = max(0, min(5, item.rating))
        let sortedStars = ratingImageViews.sorted { $0.frame.minX < $1.frame.minX }

        for (index, starView) in sortedStars.enumerated() {
            let symbolName = index < clampedRating ? "star.fill" : "star"
            starView.image = UIImage(systemName: symbolName)
        }
    }
}
