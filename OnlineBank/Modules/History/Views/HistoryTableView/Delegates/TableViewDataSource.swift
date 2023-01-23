//
//  TableViewDataSource.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 02.01.2023.
//

import UIKit
import RealmSwift

final class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var historys: Results<History>!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !historys.isEmpty {
            return historys.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
                as? CustomTableViewCell else { fatalError("No cell") }

        let history = historys[indexPath.row]
        
//        cell.textLabel?.txt = history.date
        return cell
    }
}
