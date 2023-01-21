//
//  CashInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import Foundation
import RealmSwift

protocol CashInteractorProtocol: AnyObject {
    
    var client: Results<Client>! { get }
    var clientModel: Client { get }
    var historyModel: History { get }

    init(_ presenter: CashPresenterProtocol)
    
    func getCash(string: String)
}

final class CashInteractor {

    let realmService = RealmService()
    let realm = RealmService.shared.realm
    let entity: CashEntityProtocol = CashEntity()
    weak var presenter: CashPresenterProtocol?
    
    var client: Results<Client>! {
        entity.clientObject
    }

    var clientModel: Client {
        entity.clientModel
    }
    var historyModel: History {
        entity.historyModel
    }

    required init(_ presenter: CashPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - CashInteractorProtocol
extension CashInteractor: CashInteractorProtocol {

    func getCash(string: String) {
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
