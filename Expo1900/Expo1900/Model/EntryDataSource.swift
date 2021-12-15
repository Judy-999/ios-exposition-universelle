//
//  EntryDataSource.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

protocol AlertDelegate: UIViewController {
    func showAlert(alertMessage: AlertMessage, buttonMessage: AlertMessage)
}

extension NSObject {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

class EntryDataSource: NSObject, UITableViewDataSource {
    weak var delegate: AlertDelegate?
    let entries: [KoreanEntry]
    
    init(entries: [KoreanEntry]) {
        self.entries = entries
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if entries.count == .zero {
            delegate?.showAlert(alertMessage: .jsonDecodingFailed, buttonMessage: .confirm)
        }
        
        return KoreanEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntryTableViewCell.reuseIdentifier, for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        let entry = entries[indexPath.row]
        cell.setCustomCellComponents(image: entry.imageName, title: entry.name, shortDescription: entry.shortDesc)

        return cell
    }
}
