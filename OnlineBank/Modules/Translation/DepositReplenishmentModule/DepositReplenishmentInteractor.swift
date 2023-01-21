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
    
    func onlyDigit(for string: String) -> Bool
}

final class DepositReplenishmentInteractor {

    weak var presenter: DepositReplenishmentPresenterProtocol?
    let entity: DepositReplenishmentEntityProtocol = DepositReplenishmentEntity()

    required init(_ presenter: DepositReplenishmentPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - DepositReplenishmentInteractorProtocol
extension DepositReplenishmentInteractor: DepositReplenishmentInteractorProtocol {
    var client: Results<Client>! {
        entity.clientObject
    }

    var clientModel: Client {
        entity.clientModel
    }
    var historyModel: History {
        entity.historyModel
    }
    
    func onlyDigit(for string: String) -> Bool {
        let forbiddenCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return forbiddenCharacters.isSuperset(of: characterSet)
    }
    
    func topUpDeposit(sum: Double) {
        let realm = RealmService()
        let roundSum = round(100 * sum)/100
        
//        realm.update(client, dictionary: [client.first?.deposit: ])
    }
}
