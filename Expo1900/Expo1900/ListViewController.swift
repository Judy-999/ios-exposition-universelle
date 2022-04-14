//
//  ListViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/14.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        self.items = getItems()
    }
    
    func getItems() -> [Item] {
        var items: [Item] = []
        do {
        items = try [Item].decode(with: "items")
        } catch {
            showAlert()
        }
          return items
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "오류", message: "데이터를 불러올 수 없습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        var contents = cell.defaultContentConfiguration()
        contents.attributedText = NSAttributedString(string: items[indexPath.row].name, attributes: [ .font: UIFont.systemFont(ofSize: 20, weight: .bold)])
        contents.secondaryText = items[indexPath.row].shortDescription
        contents.image = UIImage(named: items[indexPath.row].imageName)
        contents.imageProperties.maximumSize.width = CGFloat(100)

        cell.contentConfiguration = contents
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
}
