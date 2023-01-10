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
    @objc dynamic var isRegistered = false
    @objc dynamic var accountNumber = 0
    @objc dynamic var deposit = 0.0
    @objc dynamic var numberPhone = ""
    var card = List<ClientCard>()
    var history = List<History>()

   convenience init(clientID: String = UUID().uuidString, name: String = "", surname: String = "", isRegistered: Bool = false, accountNumber: Int = 0, deposit: Double = 0.0, numberPhone: String = "", card: List<ClientCard> = List<ClientCard>(), history: List<History> = List<History>()) {
        self.init()
        self.clientID = clientID
        self.name = name
        self.surname = surname
        self.isRegistered = isRegistered
        self.accountNumber = generatingAccountNumber()
        self.deposit = deposit
        self.numberPhone = numberPhone
        self.card = card
        self.history = history
    }

    func generatingAccountNumber() -> Int {
        return Int.random(in: 100_000_000_000_000_000...999_999_999_999_999_999)

    }

}

class ClientCard: Object {
    @objc dynamic var cardID = UUID().uuidString
    @objc dynamic var numberCard = ""
    @objc dynamic var cvv = 0
    @objc dynamic var endDate = ""
    @objc dynamic var nameClient = ""
    var card = List<ClientCard>()

    convenience init(cardID: String = UUID().uuidString, numberCard: String = "", cvv: Int = 0, endDate: String = "", nameClient: String = "", card: List<ClientCard> = List<ClientCard>()) {
        self.init()
        self.cardID = cardID
        self.numberCard = numberCard
        self.cvv = generatingCVV()
        self.endDate = generatingEndDate()
        self.nameClient = nameClient
        self.card = card
    }

    func generatingCVV() -> Int {
        return Int.random(in: 100...999)
    }

    func generatingEndDate() -> String {
        let int = Int.random(in: 1...12)
        return int < 10 ? "0\(int)/30" : "\(int)/30"
    }
}

class History: Object {
    @objc dynamic var isSpent = false
    @objc dynamic var sum = 0
    @objc dynamic var date = ""
    var history = List<History>()
}
