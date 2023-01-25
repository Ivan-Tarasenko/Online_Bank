//
//  DepositReplenishmentInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation
import RealmSwift

protocol DepositReplenishmentInteractorProtocol: AnyObject {
    
    var client: Results<Client>! { get }
    var clientModel: Client { get }
    var historyModel: History { get }

    init(_ presenter: DepositReplenishmentPresenterProtocol)
    func topUpDeposit(string: String)
}

final class DepositReplenishmentInteractor {
    
    let realmService = RealmService()
    let realm = RealmService.shared.realm
    let entity: DepositReplenishmentEntityProtocol = DepositReplenishmentEntity()
    weak var presenter: DepositReplenishmentPresenterProtocol?
    
    var client: Results<Client>! {
        entity.clientObject
    }

    var clientModel: Client {
        entity.clientModel
    }
    var historyModel: History {
        entity.historyModel
    }

    required init(_ presenter: DepositReplenishmentPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - DepositReplenishmentInteractorProtocol
extension DepositReplenishmentInteractor: DepositReplenishmentInteractorProtocol {
    
    func topUpDeposit(string: String) {
        guard let client = client.first else { return }
        let value = Double(string)
        let roundValue = round(100 * value!)/100
        let sum = client.deposit + roundValue
        let dic = ["deposit": sum]
        
        historyModel.isSpent = true
        historyModel.value = roundValue
        historyModel.date = GlobalFunc.currentDate()
    
        realmService.create(historyModel)
        realmService.update(client, dictionary: dic)
    }
}
