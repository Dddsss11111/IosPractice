import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let items: [FavoriteItem] = FavoritesData.items
    private let cellIdentifier = "FavoriteCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? FavoriteCell else {
            return UITableViewCell()
        }

        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
