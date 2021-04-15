//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/04/11.
//

import UIKit

class ItemListViewController: UIViewController {
    
    var items: [ExhibitionWorks] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData(assetName: "items")
    }
    
    private func decodeData(assetName: String) {
        let itemsDecoder = JSONDecoder()
        guard let assetData = NSDataAsset(name: assetName) else { return }
        
        do {
            self.items = try itemsDecoder.decode([ExhibitionWorks].self, from: assetData.data)
        } catch {
            print(ErrorData.dataDecodingError.errorMassege)
        }
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.itemInformation(data: items[indexPath.row])
        return cell
    }
}
