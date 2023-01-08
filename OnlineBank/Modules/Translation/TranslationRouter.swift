//
//  TranslationRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol TranslationRouterProtocol: AnyObject {

    init(_ viewController: TranslationViewController)
}

final class TranslationRouter {

    weak var viewController: TranslationViewController?

    init(_ viewController: TranslationViewController) {
        self.viewController = viewController
    }
}

// MARK: - TranslationRouterProtocol
extension TranslationRouter: TranslationRouterProtocol {

}
