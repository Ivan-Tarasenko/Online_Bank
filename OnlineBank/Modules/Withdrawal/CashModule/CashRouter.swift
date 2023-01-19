//
//  CashRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import UIKit

protocol CashRouterProtocol: AnyObject {

    init(_ viewController: CashViewController)
}

final class CashRouter {

    weak var viewController: CashViewController?

    init(_ viewController: CashViewController) {
        self.viewController = viewController
    }
}

// MARK: - CashRouterProtocol
extension CashRouter: CashRouterProtocol {

}
