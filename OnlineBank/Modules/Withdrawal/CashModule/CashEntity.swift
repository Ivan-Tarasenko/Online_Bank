//
//  CashEntity.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import UIKit
import RealmSwift

protocol CashEntityProtocol {
    var clientModel: Client { get }
    var historyModel: History { get }

    var clientObject: Results<Client>! { get }
}

struct CashEntity {
    let realm = RealmService.shared.realm
    var clientModel: Client = Client()
    var historyModel: History = History()
}

// MARK: - CashEntityProtocol
extension CashEntity: CashEntityProtocol {
    var clientObject: Results<Client>! { return realm.objects(Client.self) }
}
