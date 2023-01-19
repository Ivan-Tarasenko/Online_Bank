//
//  DepositReplenishmentInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol DepositReplenishmentInteractorProtocol: AnyObject {

    init(_ presenter: DepositReplenishmentPresenterProtocol)
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

}
