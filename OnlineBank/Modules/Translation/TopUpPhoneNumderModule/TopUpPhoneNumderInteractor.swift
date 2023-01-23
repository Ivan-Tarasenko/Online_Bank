//
//  TopUpPhoneNumderInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation
import RealmSwift

protocol TopUpPhoneNumderInteractorProtocol: AnyObject {
    
    var client: Results<Client>! { get }
    var clientModel: Client { get }
    var historyModel: History { get }

    init(_ presenter: TopUpPhoneNumderPresenterProtocol)
    
    func topUpSelfPhone(string: String)
}

final class TopUpPhoneNumderInteractor {
    
    let realmService = RealmService()
    let realm = RealmService.shared.realm
    let entity: TopUpPhoneNumderEntityProtocol = TopUpPhoneNumderEntity()
    weak var presenter: TopUpPhoneNumderPresenterProtocol?

    required init(_ presenter: TopUpPhoneNumderPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - TopUpPhoneNumderInteractorProtocol
extension TopUpPhoneNumderInteractor: TopUpPhoneNumderInteractorProtocol {
    
    var client: Results<Client>! {
        entity.clientObject
    }
    
    var clientModel: Client {
        entity.clientModel
    }
    var historyModel: History {
        entity.historyModel
    }

    func topUpSelfPhone(string: String) {
        guard let client = client.first else { return }
        let value = Double(string)
        let roundValue = round(100 * value!)/100
        let sum = client.deposit - roundValue
        let dic = ["deposit": sum]
        
        historyModel.isSpent = false
        historyModel.value = roundValue
        historyModel.date = GlobalFunc.currentDate()
    
        realmService.create(historyModel)
        realmService.update(client, dictionary: dic)
    }
}
