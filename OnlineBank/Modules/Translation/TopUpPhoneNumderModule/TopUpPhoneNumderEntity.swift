//
//  TopUpPhoneNumderEntity.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit
import RealmSwift

protocol TopUpPhoneNumderEntityProtocol {
    var clientModel: Client { get }
    var historyModel: History { get }

    var clientObject: Results<Client>! { get }
}

struct TopUpPhoneNumderEntity {
    let realm = RealmService.shared.realm
    var clientModel: Client = Client()
    var historyModel: History = History()
}

// MARK: - TopUpPhoneNumderEntityProtocol
extension TopUpPhoneNumderEntity: TopUpPhoneNumderEntityProtocol {
    var clientObject: Results<Client>! { return realm.objects(Client.self) }
}
