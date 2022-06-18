//
//  KoreaItemsTableViewController.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/17.
//

import UIKit

class KoreaItemsTableViewController: UITableViewController {
    var koreaItems = [KoreaItem]()
    weak var sendDataDelegate: SendDataDelgate?
    
    let koreaItemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(KoreaItemsTableViewCell.self, forCellReuseIdentifier: "KoreaItemsTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
        self.tableView = koreaItemsTableView
        decodingJsonData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KoreaItemsTableViewCell", for: indexPath) as? KoreaItemsTableViewCell else {
            return UITableViewCell()
        }
        cell.itemImageView.image = koreaItems[indexPath.row].image
        cell.titleLabel.text = koreaItems[indexPath.row].name
        cell.shortDescriptionLabel.text = koreaItems[indexPath.row].shortDescription
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailViewController = ItemDetailViewController()
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
        sendDataDelegate = itemDetailViewController
        sendDataDelegate?.sendItemData(item: koreaItems[indexPath.row])
    }
    
    private func decodingJsonData() {
        guard let items = NSDataAsset(name: "items"),
              let decondedKoreaItems = try? JSONDecoder().decode([KoreaItem].self, from: items.data) else {
            return
        }
        self.koreaItems = decondedKoreaItems
    }
}

protocol SendDataDelgate: AnyObject {
    func sendItemData(item: KoreaItem)
}
