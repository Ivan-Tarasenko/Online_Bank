//
//  MainRouter.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {

    func transitionOnNewProduct()

    init(_ viewController: MainViewController)
}

final class MainRouter {

    weak var viewController: MainViewController?

    init(_ viewController: MainViewController) {
        self.viewController = viewController
    }
}

// MARK: - MainRouterProtocol
extension MainRouter: MainRouterProtocol {
    func transitionOnNewProduct() {
        viewController?.present(NewProductViewController(contentView: NewProductContentView()), animated: true)
        print("Transition MewProduct")
    }

}
