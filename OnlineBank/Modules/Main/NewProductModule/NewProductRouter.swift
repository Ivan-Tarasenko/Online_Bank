//
//  NewProductRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol NewProductRouterProtocol: AnyObject {

    init(_ viewController: NewProductViewController)
}

final class NewProductRouter {

    weak var viewController: NewProductViewController?

    init(_ viewController: NewProductViewController) {
        self.viewController = viewController
    }
}

// MARK: - NewProductRouterProtocol
extension NewProductRouter: NewProductRouterProtocol {

}
