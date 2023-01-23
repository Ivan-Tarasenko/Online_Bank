//
//  HistoryEntity.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit
import RealmSwift

protocol HistoryEntityProtocol {
    var history: Results<History>! { get }
    var arrowUp: UIImage { get }
    var arrowDown: UIImage { get }
}

struct HistoryEntity {
    let realm = RealmService.shared.realm
}

// MARK: - HistoryEntityProtocol
extension HistoryEntity: HistoryEntityProtocol {
    var history: Results<History>! { return realm.objects(History.self) }
    var arrowUp: UIImage { return UIImage(systemName: "arrow.up")! }
    var arrowDown: UIImage { return UIImage(systemName: "arrow.up")! }
}
