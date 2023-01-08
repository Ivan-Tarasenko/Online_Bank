//
//  WithdrawalRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol WithdrawalRouterProtocol: AnyObject {

    init(_ viewController: WithdrawalViewController)
}

final class WithdrawalRouter {

    weak var viewController: WithdrawalViewController?

    init(_ viewController: WithdrawalViewController) {
        self.viewController = viewController
    }
}

// MARK: - WithdrawalRouterProtocol
extension WithdrawalRouter: WithdrawalRouterProtocol {

}
