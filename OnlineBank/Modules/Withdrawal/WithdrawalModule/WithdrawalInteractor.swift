//
//  WithdrawalInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol WithdrawalInteractorProtocol: AnyObject {

    init(_ presenter: WithdrawalPresenterProtocol)
}

final class WithdrawalInteractor {

    weak var presenter: WithdrawalPresenterProtocol?
    let entity: WithdrawalEntityProtocol = WithdrawalEntity()

    required init(_ presenter: WithdrawalPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - Extension private func
private extension WithdrawalViewController {

}

// MARK: - WithdrawalInteractorProtocol
extension WithdrawalInteractor: WithdrawalInteractorProtocol {

}
