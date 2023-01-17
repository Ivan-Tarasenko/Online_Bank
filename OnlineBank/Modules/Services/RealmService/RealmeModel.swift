//
//  RealmeService.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 05.01.2023.
//

import Foundation
import RealmSwift

class Client: Object {
    @objc dynamic var clientID = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var surname = ""
    @objc dynamic var deposit = 0.0
    @objc dynamic var numberPhone = ""
    let cards = List<ClientCard>()
    let history = List<History>()
}

class ClientCard: Object {
    @objc dynamic var cardID = UUID().uuidString
    @objc dynamic var numberCard = ""
    @objc dynamic var cvv = 0
    @objc dynamic var endDate = ""
    @objc dynamic var nameClient = ""
}

class History: Object {
    @objc dynamic var isSpent = false
    @objc dynamic var sum = 0
    @objc dynamic var date = ""
    let history = List<History>()
}
