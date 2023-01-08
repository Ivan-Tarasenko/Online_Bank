//
//  HistoryRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol HistoryRouterProtocol: AnyObject {

    init(_ viewController: HistoryViewController)
}

final class HistoryRouter {

    weak var viewController: HistoryViewController?

    init(_ viewController: HistoryViewController) {
        self.viewController = viewController
    }
}

// MARK: - HistoryRouterProtocol
extension HistoryRouter: HistoryRouterProtocol {

}
