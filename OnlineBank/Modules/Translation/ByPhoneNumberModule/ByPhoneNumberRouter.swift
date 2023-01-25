//
//  ByPhoneNumberRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol ByPhoneNumberRouterProtocol: AnyObject {

    init(_ viewController: ByPhoneNumberViewController)
}

final class ByPhoneNumberRouter {

    weak var viewController: ByPhoneNumberViewController?

    init(_ viewController: ByPhoneNumberViewController) {
        self.viewController = viewController
    }
}

// MARK: - ByPhoneNumberRouterProtocol
extension ByPhoneNumberRouter: ByPhoneNumberRouterProtocol {

}
