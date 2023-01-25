//
//  DepositReplenishmentRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol DepositReplenishmentRouterProtocol: AnyObject {

    init(_ viewController: DepositReplenishmentViewController)
}

final class DepositReplenishmentRouter {

    weak var viewController: DepositReplenishmentViewController?

    init(_ viewController: DepositReplenishmentViewController) {
        self.viewController = viewController
    }
}

// MARK: - DepositReplenishmentRouterProtocol
extension DepositReplenishmentRouter: DepositReplenishmentRouterProtocol {

}
