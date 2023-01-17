//
//  RegistrationEntity.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import UIKit
import RealmSwift

protocol RegistrationEntityProtocol {

    var client: Client { get }
    var card: ClientCard { get }

    var clientObject: Results<Client>! { get }
}

struct RegistrationEntity {
    let realm = RealmService.shared.realm
    var client: Client = Client()
    var card: ClientCard = ClientCard()
}

// MARK: - RegistrationEntityProtocol
extension RegistrationEntity: RegistrationEntityProtocol {
    var clientObject: Results<Client>! { return realm.objects(Client.self) }
}
