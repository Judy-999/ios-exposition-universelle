//
//  ExhibitionItemsViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

final class ExhibitionItemsViewController: UIViewController {
    var exhibitionItems: [ExhibitionItem] = []
    
    @IBOutlet weak private var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemsTableView.dataSource = self
        self.itemsTableView.delegate = self
        self.exhibitionItems = decodeJson()
    }
    
    private func decodeJson() -> [ExhibitionItem] {
        do {
            let fileName = "items"
            let decodedData = try [ExhibitionItem].decode(from: fileName)
            return decodedData
        } catch {}
        
        return exhibitionItems
    }
}

extension ExhibitionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibitionItems.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let exhibitionItemCell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? ExhibitionItemsTableViewCell
        else {
            return UITableViewCell()
        }
        
        let itemAtRow = self.exhibitionItems[indexPath.row]
        exhibitionItemCell.setUpCell(by: itemAtRow)

        return exhibitionItemCell
    }
}

extension ExhibitionItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(
            identifier: DetailViewController.identifier) as? DetailViewController
        {
            detailViewController.exhibitionItem = self.exhibitionItems[indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

