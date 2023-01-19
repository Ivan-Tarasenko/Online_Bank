//
//  WithdrawalRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol WithdrawalRouterProtocol: AnyObject {

    init(_ viewController: WithdrawalViewController)

    func transitionOnCashController()
    func transitionOnRequestController()
}

final class WithdrawalRouter {

    weak var viewController: WithdrawalViewController?

    init(_ viewController: WithdrawalViewController) {
        self.viewController = viewController
    }
}

// MARK: - WithdrawalRouterProtocol
extension WithdrawalRouter: WithdrawalRouterProtocol {
    func transitionOnCashController() {
        let cashController = CashViewController(contentView: CashContentView())
        viewController?.present(cashController, animated: true)
    }
    func transitionOnRequestController() {
        let requestController = RequestManyViewController(contentView: RequestManyContentView())
        viewController?.present(requestController, animated: true)
    }
}
