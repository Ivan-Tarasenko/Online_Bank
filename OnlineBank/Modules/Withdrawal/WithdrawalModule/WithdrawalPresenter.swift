//
//  WithdrawalPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol WithdrawalPresenterProtocol: AnyObject {
    init(_ view: WithdrawalContentViewProtocol)
    init(_ controller: WithdrawalViewControllerProtocol)

    func cashPressed()
    func requestPressed()
}

final class WithdrawalPresenter {

    weak var viewController: WithdrawalViewControllerProtocol?
    weak var view: WithdrawalContentViewProtocol?
    var interactor: WithdrawalInteractorProtocol!
    var router: WithdrawalRouterProtocol!

    required init(_ view: WithdrawalContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: WithdrawalViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - WithdrawalPresenterProtocol
extension WithdrawalPresenter: WithdrawalPresenterProtocol {

    func cashPressed() {
        router.transitionOnCashController()
    }
    func requestPressed() {
        router.transitionOnRequestController()
    }

}
