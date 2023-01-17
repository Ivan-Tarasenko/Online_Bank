//
//  MainEntity.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import UIKit
import RealmSwift

protocol MainEntityProtocol {
    var image: UIImage { get }

    var clientObject: Results<Client>! { get }
    var clientCardObject: Results<ClientCard>! { get }
}

struct MainEntity {
    let realm = RealmService.shared.realm
    var image: UIImage { return UIImage(imageLiteralResourceName: "card")}
}

// MARK: - MainEntityProtocol
extension MainEntity: MainEntityProtocol {

    var clientObject: Results<Client>! { return realm.objects(Client.self) }
    var clientCardObject: Results<ClientCard>! {return realm.objects(ClientCard.self)}
}
