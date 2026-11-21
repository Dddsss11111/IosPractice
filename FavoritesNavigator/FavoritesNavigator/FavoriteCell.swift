import UIKit

final class FavoriteCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        itemImageView.image = UIImage(named: item.imageName)
    }
}
