//
//  CashInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import Foundation

protocol CashInteractorProtocol: AnyObject {

    init(_ presenter: CashPresenterProtocol)
}

final class CashInteractor {

    weak var presenter: CashPresenterProtocol?
    let entity: CashEntityProtocol = CashEntity()

    required init(_ presenter: CashPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - CashInteractorProtocol
extension CashInteractor: CashInteractorProtocol {

}
