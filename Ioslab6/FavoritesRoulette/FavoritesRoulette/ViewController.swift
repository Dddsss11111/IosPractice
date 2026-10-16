import UIKit

struct FavoriteItem {
    let title: String
    let descriptionText: String
    let imageName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!

    let items: [FavoriteItem] = [
        FavoriteItem(title: "Inception", descriptionText: "A thief who steals corporate secrets through the use of dream-sharing technology.", imageName: "i"),
        FavoriteItem(title: "Interstellar", descriptionText: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", imageName: "i-2"),
        FavoriteItem(title: "Inglourious Basterds", descriptionText: "In Nazi-occupied France, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers.", imageName: "i-3"),
        FavoriteItem(title: "Avengers: Endgame", descriptionText: "After the devastating events of Infinity War, the universe is in ruins.", imageName: "i-4"),
        FavoriteItem(title: "The Prestige", descriptionText: "Two stage magicians in 1890s London engage in a bitter battle to create the ultimate illusion.", imageName: "i-5"),
        FavoriteItem(title: "The Green Mile", descriptionText: "The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder.", imageName: "i-6"),
        FavoriteItem(title: "The Shawshank Redemption", descriptionText: "Over the course of several years, two convicts form a friendship, seeking consolation and redemption.", imageName: "i-7"),
        FavoriteItem(title: "The Gentlemen", descriptionText: "An American expat tries to sell off his highly profitable marijuana empire in London.", imageName: "i-8"),
        FavoriteItem(title: "Fight Club", descriptionText: "An insomniac office worker and a devil-may-care soap maker form an underground fight club.", imageName: "i-9"),
        FavoriteItem(title: "Spirited Away", descriptionText: "During her family's move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits.", imageName: "i-10")
    ]
    
    var lastIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ЭКРАН ЗАПУСТИЛСЯ!")
        showRandomItem()
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        showRandomItem()
    }
    
    func showRandomItem() {
        guard !items.isEmpty else { return }
        
        var randomIndex = Int.random(in: 0..<items.count)
        
        if let previous = lastIndex, items.count > 1 {
            while randomIndex == previous {
                randomIndex = Int.random(in: 0..<items.count)
            }
        }
        
        lastIndex = randomIndex
        let currentItem = items[randomIndex]
        
        titleLabel.text = currentItem.title
        descriptionLabel.text = currentItem.descriptionText
        
        if let image = UIImage(named: currentItem.imageName) {
            imageView.image = image
        }
    }
}
