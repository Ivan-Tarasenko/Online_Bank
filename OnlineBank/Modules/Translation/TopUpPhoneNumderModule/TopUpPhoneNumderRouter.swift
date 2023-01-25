//
//  TopUpPhoneNumderRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol TopUpPhoneNumderRouterProtocol: AnyObject {

    init(_ viewController: TopUpPhoneNumderViewController)
}

final class TopUpPhoneNumderRouter {

    weak var viewController: TopUpPhoneNumderViewController?

    init(_ viewController: TopUpPhoneNumderViewController) {
        self.viewController = viewController
    }
}

// MARK: - TopUpPhoneNumderRouterProtocol
extension TopUpPhoneNumderRouter: TopUpPhoneNumderRouterProtocol {

}
