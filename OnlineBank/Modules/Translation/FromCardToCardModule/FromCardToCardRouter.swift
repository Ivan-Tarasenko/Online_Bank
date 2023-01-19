//
//  FromCardToCardRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol FromCardToCardRouterProtocol: AnyObject {

    init(_ viewController: FromCardToCardViewController)
}

final class FromCardToCardRouter {

    weak var viewController: FromCardToCardViewController?

    init(_ viewController: FromCardToCardViewController) {
        self.viewController = viewController
    }
}

// MARK: - FromCardToCardRouterProtocol
extension FromCardToCardRouter: FromCardToCardRouterProtocol {

}
