//
//  HistoryEntity.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit
import RealmSwift

protocol HistoryEntityProtocol {
    var clientObject: Results<Client>! { get }
    var history: Results<History>! { get }
}

struct HistoryEntity {
    let realm = RealmService.shared.realm
}

// MARK: - HistoryEntityProtocol
extension HistoryEntity: HistoryEntityProtocol {
    var history: Results<History>! { return realm.objects(History.self) }
    
    var clientObject: Results<Client>! { return realm.objects(Client.self) }
}
