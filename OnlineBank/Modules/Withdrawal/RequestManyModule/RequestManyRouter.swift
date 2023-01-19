//
//  RequestManyRouter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol RequestManyRouterProtocol: AnyObject {

    init(_ viewController: RequestManyViewController)
}

final class RequestManyRouter {

    weak var viewController: RequestManyViewController?

    init(_ viewController: RequestManyViewController) {
        self.viewController = viewController
    }
}

// MARK: - RequestManyRouterProtocol
extension RequestManyRouter: RequestManyRouterProtocol {

}
